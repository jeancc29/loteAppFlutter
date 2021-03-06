import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:loterias/core/classes/mydate.dart';
import 'package:loterias/core/classes/utils.dart';
import 'package:loterias/core/models/monedas.dart';
import 'package:loterias/core/services/reporteservice.dart';
import 'package:loterias/main.dart';
import 'package:loterias/ui/widgets/mycontainerbutton.dart';
import 'package:loterias/ui/widgets/myempty.dart';
import 'package:loterias/ui/widgets/myfilter.dart';
import 'package:rxdart/rxdart.dart';

class HistoricoVentasScreen extends StatefulWidget {
  @override
  _HistoricoVentasScreenState createState() => _HistoricoVentasScreenState();
}

class _HistoricoVentasScreenState extends State<HistoricoVentasScreen> {
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;

  MyDate _fecha = MyDate.hoy;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamController<List> _streamControllerHistorio;
  List listaDinamicaBancas = [];
  Map<String, dynamic> mapBancas;
  var _fechaInicial = DateTime.now();
  var _fechaFinal = DateTime.now();
  String _selectedOption = "Con ventas";
  List<String> listaOpciones = ["Todos", "Con ventas", "Con premios", "Con tickets pendientes", "Sin ventas"];
  bool _cargando = false;
  DateFormat _dateFormat;
  List<int> listaLimite = [20, 50, 80, 120];
  int _limite = 20;
  List<Moneda> listaMoneda = [];
  Moneda _moneda;

  @override
  initState(){
    _streamControllerHistorio = BehaviorSubject();
    initializeDateFormatting();
    // _dateFormat = new DateFormat.yMMMMd(MyApp.myLocale.languageCode);
    _dateFormat = new DateFormat.yMMMMEEEEd(MyApp.myLocale.languageCode);
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
    ]);
    _historicoVentas();
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _streamControllerHistorio.close();
    super.dispose();
    
    // _streamControllerHistorio.close();

  }

  _filtrarFecha(){
    print("_filtrarFecha: ${_fecha.toString()}");
    switch (_fecha) {
      case MyDate.hoy:
        var fechas = MyDate.getHoy();
        _fechaInicial = fechas[0];
        _fechaFinal = fechas[1];
        break;
      case MyDate.ayer:
        var fechas = MyDate.getAyer();
        _fechaInicial = fechas[0];
        _fechaFinal = fechas[1];
        break;
      case MyDate.estaSemana:
        var fechas = MyDate.getEstaSemana();
        _fechaInicial = fechas[0];
        _fechaFinal = fechas[1];
        break;
      case MyDate.laSemanaPasada:
        var fechas = MyDate.getSemanaPasada();
        _fechaInicial = fechas[0];
        _fechaFinal = fechas[1];
        break;
      case MyDate.ultimos2Dias:
        var fechas = MyDate.getUltimos2Dias();
        _fechaInicial = fechas[0];
        _fechaFinal = fechas[1];
        break;
      case MyDate.esteMes:
        var fechas = MyDate.getEsteMes();
        _fechaInicial = fechas[0];
        _fechaFinal = fechas[1];
        break;
      default:
        
    }
  }



  _historicoVentas() async {
    try{
      // setState(() => _cargando = true);
      _streamControllerHistorio.add(null);
      _filtrarFecha();
      var parsed = await ReporteService.historico(scaffoldKey: _scaffoldKey, fechaDesde: _fechaInicial, fechaHasta: _fechaFinal, opcion: _selectedOption, moneda: _moneda, limite: _limite);
      listaDinamicaBancas = List.from(parsed["bancas"]);
      if(listaMoneda.length == 0)
        listaMoneda = (parsed["monedas"] != null) ? parsed["monedas"].map<Moneda>((e) => Moneda.fromMap(e)).toList() : [];
      _streamControllerHistorio.add(listaDinamicaBancas);

      if(_moneda == null)
        setState(() => _moneda = (listaMoneda.length > 0) ? listaMoneda[0] : null);

      _filterTable();
    } on Exception catch(e){
      _streamControllerHistorio.add([]);
      
    }
  }

  _filterTable(){
    switch(_selectedOption){
      case "Con ventas":
        _streamControllerHistorio.add(listaDinamicaBancas.where((b) => Utils.toDouble(b["ventas"].toString()) > 0).toList());
        break;
      case "Con premios":
        _streamControllerHistorio.add(listaDinamicaBancas.where((b) => Utils.toDouble(b["premios"].toString()) > 0).toList());
        break;
      case "Con tickets pendientes":
        _streamControllerHistorio.add(listaDinamicaBancas.where((b) => Utils.toDouble(b["pendientes"].toString()) > 0).toList());
        break;
      default:
        _streamControllerHistorio.add(listaDinamicaBancas);
        break;
    }
  }

  Widget _buildTable(List map){
   var tam = (map != null) ? map.length : 0;
   List<DataRow> rows;
   if(tam == 0){
     rows = [];
   }else{
    //  rows = map.asMap().map((idx, b)
    //       => MapEntry(
    //         idx,
    //         TableRow(
              
    //           children: [
    //             Container(
    //               padding: EdgeInsets.only(top: 5, bottom: 5),
    //               color: Utils.colorGreyFromPairIndex(idx: idx),
    //               child: Center(
    //                 child: InkWell(onTap: (){}, child: Text(b["descripcion"], style: TextStyle(fontSize: 14, decoration: TextDecoration.underline)))
    //               ),
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(top: 5, bottom: 5),
    //               color: Utils.colorGreyFromPairIndex(idx: idx), 
    //               child: Center(child: Text("${Utils.toCurrency(b["ventas"])}", style: TextStyle(fontSize: 14)))
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(top: 5, bottom: 5),
    //               color: Utils.colorGreyFromPairIndex(idx: idx), 
    //               child: Center(child: Text("${Utils.toCurrency(b["comisiones"])}", style: TextStyle(fontSize: 14)))
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(top: 5, bottom: 5),
    //               color: Utils.colorGreyFromPairIndex(idx: idx), 
    //               child: Center(child: Text("${Utils.toCurrency(b["descuentos"])}", style: TextStyle(fontSize: 14)))
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(top: 5, bottom: 5),
    //               color: Utils.colorGreyFromPairIndex(idx: idx), 
    //               child: Center(child: Text("${Utils.toCurrency(b["premios"])}", style: TextStyle(fontSize: 14)))
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(top: 5, bottom: 5),
    //               color: (Utils.toDouble(b["totalNeto"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa, 
    //               child: Center(child: Text("${Utils.toCurrency(b["totalNeto"])}", style: TextStyle(fontSize: 14)))
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(top: 5, bottom: 5),
    //               color: (Utils.toDouble(b["balance"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa, 
    //               child: Center(child: Text("${Utils.toCurrency(b["balance"])}", style: TextStyle(fontSize: 14)))
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(top: 5, bottom: 5),
    //               color: (Utils.toDouble(b["balanceActual"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa, 
    //               child: Center(child: Text("${Utils.toCurrency(b["balanceActual"])}", style: TextStyle(fontSize: 14)))
    //             ),
    //             // Center(child: IconButton(icon: Icon(Icons.delete, size: 28,), onPressed: () async {},)),
    //           ],
    //         )
    //       )
        
    //     ).values.toList();
        
    // rows.insert(0, 
    //           TableRow(
    //             decoration: BoxDecoration(color: Utils.colorPrimary),
    //             children: [
    //               // buildContainer(Colors.blue, 50.0),
    //               // buildContainer(Colors.red, 50.0),
    //               // buildContainer(Colors.blue, 50.0),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
    //                 child: Center(child: Text('Bancas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
    //                 child: Center(child: Text('Ventas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, )),),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
    //                 child: Center(child: Text('Comis.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
    //                 child: Center(child: Text('Desc.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
    //                 child: Center(child: Text('Premios', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
    //                 child: Center(child: Text('Neto', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
    //                 child: Center(child: Text('Balance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
    //                 child: Center(child: Text('Balance mas ventas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
    //               ),
    //               // Padding(
    //               //   padding: const EdgeInsets.all(8.0),
    //               //   child: Center(child: Text('Borrar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),),
    //               // ),
    //             ]
    //           )
    //           );

      rows = map.asMap().map((idx, b)
                    => MapEntry(
                      idx,
                      DataRow(

                        cells: [DataCell(Text(b["descripcion"])), DataCell(Text("${Utils.toCurrency(b["ventas"])}")), DataCell(Text("${Utils.toCurrency(b["comisiones"])}")), DataCell(Text("${Utils.toCurrency(b["descuentos"])}")), 
                      DataCell(Text("${Utils.toCurrency(b["premios"])}")), 
                      DataCell(
                        Container(
                          // padding: EdgeInsets.only(top: 5, bottom: 5),
                          color: (Utils.toDouble(b["totalNeto"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa, 
                          child: Center(child: Text("${Utils.toCurrency(b["totalNeto"])}", style: TextStyle(fontSize: 14)))
                        ),
                      ),  
                      DataCell(
                        Container(
                          // padding: EdgeInsets.only(top: 5, bottom: 5),
                          color: (Utils.toDouble(b["balance"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa, 
                          child: Center(child: Text("${Utils.toCurrency(b["balance"])}", style: TextStyle(fontSize: 14)))
                        ),
                      ), 
                      DataCell(
                        Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          color: (Utils.toDouble(b["balanceActual"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa, 
                          child: Center(child: Text("${Utils.toCurrency(b["balanceActual"])}", style: TextStyle(fontSize: 14)))
                        ),
                      )
                      ])
                    )
                  ).values.toList();

      var totales = _calcularTotal(map);
      rows.add( 
              DataRow(
                // decoration: BoxDecoration(color: Utils.colorPrimary),
                cells: [
                  // buildContainer(Colors.blue, 50.0),
                  // buildContainer(Colors.red, 50.0),
                  // buildContainer(Colors.blue, 50.0),
                  DataCell(
                     Center(child: Text('Totales', style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold, color: Utils.colorPrimary)),),
                  ),
                  DataCell(
                    Center(child: Text('${Utils.toCurrency(Utils.redondear(totales["ventas"]))}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Utils.colorPrimary)),),
                  ),
                  DataCell(
                    Center(child: Text('${Utils.toCurrency(Utils.redondear(totales["comisiones"]))}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Utils.colorPrimary)),),
                  ),
                  DataCell(
                    Center(child: Text('${Utils.toCurrency(Utils.redondear(totales["descuentos"]))}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Utils.colorPrimary)),),
                  ),
                  DataCell(
                    Center(child: Text('${Utils.toCurrency(Utils.redondear(totales["premios"]))}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Utils.colorPrimary)),),
                  ),
                  DataCell(
                    Center(child: Text('${Utils.toCurrency(Utils.redondear(totales["totalNeto"]))}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Utils.colorPrimary)),),
                  ),
                  DataCell(
                    Center(child: Text('${Utils.toCurrency(Utils.redondear(totales["balance"]))}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Utils.colorPrimary)),),
                  ),
                  DataCell(
                    Center(child: Text('${Utils.toCurrency(Utils.redondear(totales["balanceActual"]))}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Utils.colorPrimary)),),
                  ),
                 
                ]
              )
              );
        
   }

  // return Flexible(
  //   child: ListView.builder(
  //     itemCount: map == null ? 1 : map.length + 1,
  //     itemBuilder: (BuildContext context, int index) {
  //         if (index == 0) {
  //             // return the header
  //             return new Row(children: [
  //               Padding(
  //                   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
  //                   child: Center(child: Text('Bancas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
  //                   child: Center(child: Text('Ventas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, )),),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
  //                   child: Center(child: Text('Comis.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
  //                   child: Center(child: Text('Desc.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
  //                   child: Center(child: Text('Premios', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
  //                   child: Center(child: Text('Neto', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
  //                   child: Center(child: Text('Balance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0, right: 4.0),
  //                   child: Center(child: Text('Balance mas ventas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),),
  //                 ),
  //             ],);
  //         }
  //         index -= 1;

  //         // return row
  //         var b = map[index];
  //         return Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Container(
  //                 padding: EdgeInsets.only(top: 5, bottom: 5),
  //                 color: Utils.colorGreyFromPairIndex(idx: index),
  //                 child: Center(
  //                   child: InkWell(onTap: (){}, child: Text(b["descripcion"], style: TextStyle(fontSize: 14, decoration: TextDecoration.underline)))
  //                 ),
  //               ),
  //               Container(
  //                 padding: EdgeInsets.only(top: 5, bottom: 5),
  //                 color: Utils.colorGreyFromPairIndex(idx: index), 
  //                 child: Center(child: Text("${Utils.toCurrency(b["ventas"])}", style: TextStyle(fontSize: 14)))
  //               ),
  //               Container(
  //                 padding: EdgeInsets.only(top: 5, bottom: 5),
  //                 color: Utils.colorGreyFromPairIndex(idx: index), 
  //                 child: Center(child: Text("${Utils.toCurrency(b["comisiones"])}", style: TextStyle(fontSize: 14)))
  //               ),
  //               Container(
  //                 padding: EdgeInsets.only(top: 5, bottom: 5),
  //                 color: Utils.colorGreyFromPairIndex(idx: index), 
  //                 child: Center(child: Text("${Utils.toCurrency(b["descuentos"])}", style: TextStyle(fontSize: 14)))
  //               ),
  //               Container(
  //                 padding: EdgeInsets.only(top: 5, bottom: 5),
  //                 color: Utils.colorGreyFromPairIndex(idx: index), 
  //                 child: Center(child: Text("${Utils.toCurrency(b["premios"])}", style: TextStyle(fontSize: 14)))
  //               ),
  //               Container(
  //                 padding: EdgeInsets.only(top: 5, bottom: 5),
  //                 color: (Utils.toDouble(b["totalNeto"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa, 
  //                 child: Center(child: Text("${Utils.toCurrency(b["totalNeto"])}", style: TextStyle(fontSize: 14)))
  //               ),
  //               Container(
  //                 padding: EdgeInsets.only(top: 5, bottom: 5),
  //                 color: (Utils.toDouble(b["balance"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa, 
  //                 child: Center(child: Text("${Utils.toCurrency(b["balance"])}", style: TextStyle(fontSize: 14)))
  //               ),
  //               Container(
  //                 padding: EdgeInsets.only(top: 5, bottom: 5),
  //                 color: (Utils.toDouble(b["balanceActual"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa, 
  //                 child: Center(child: Text("${Utils.toCurrency(b["balanceActual"])}", style: TextStyle(fontSize: 14)))
  //               ),
  //           ],
  //         );
  //     },
  //   ),
  // );
  // 
  // return Flexible(
  //   child: HorizontalDataTable(
  //     headerWidgets: [

  //     ],
  //   )
  // )

  return Flexible(
      child: ListView(
      children: <Widget>[
        // ListTile(
        //   leading: CircleAvatar(child: Text("01", style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue,),
        //   title: Text("Banca1"),
        //   subtitle: RichText(text: TextSpan(
        //     style: TextStyle(color: Colors.grey),
        //     children: [
        //       TextSpan(text: "10,000 Comis."),
        //       TextSpan(text: "  •  100 Desc."),
        //       TextSpan(text: "  •  200,000 premios"),
        //       TextSpan(text: "  •  200,000 Balance"),
        //       TextSpan(text: "  •  1000,000 Balance mas ventas"),
              
        //     ]
        //   )),
        //   trailing: Text("\$30,000", style: TextStyle(color: Colors.green[700]),),
        // ),
        // ListTile(
        //   leading: CircleAvatar(child: Text("02", style: TextStyle(color: Colors.white)), backgroundColor: Colors.red,),
        //   title: Text("Banca2"),
        //   subtitle: RichText(text: TextSpan(
        //     style: TextStyle(color: Colors.grey),
        //     children: [
        //       TextSpan(text: "200 Comis."),
        //       TextSpan(text: "  •  500 Desc."),
        //       TextSpan(text: "  •  1,000 premios"),
        //       TextSpan(text: "  •  200,000 Balance"),
        //       TextSpan(text: "  •  1000,000 Balance mas ventas"),
        //     ]
        //   )),
        //   trailing: Text("\$30,000", style: TextStyle(color: Colors.green[700]),),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: 
                DataTable(
                  headingRowHeight: 30,
                  // horizontalMargin: 0,
                  headingTextStyle: TextStyle(color: Colors.white),
                  headingRowColor: MaterialStateProperty.all(Utils.colorPrimary),
                  columns: [DataColumn(label: Text("Banca",)), DataColumn(label: Center(child: Text("Venta"))), DataColumn(label: Text("Comis.")), DataColumn(label: Text("Desc.")), DataColumn(label: Text("Premios")), DataColumn(label: Center(child: Text("Neto"))), DataColumn(label: Text("Balance")), DataColumn(label: Text("Balance mas ventas"))],
                  rows: rows
                ),
              //   Table(
              //   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              //   columnWidths: <int, TableColumnWidth>{
              //     // 1 : FractionColumnWidth(.12),
              //     7 : FractionColumnWidth(.28)
              //     },
              //   children: rows,
              //  ),
          ),
        ),
      ],
    ),
  );
  
 }

 Map<String, dynamic> _calcularTotal(List lista){
  double ventas = 0;
  double comisiones = 0;
  double descuentos = 0;
  double premios = 0;
  double totalNeto = 0;
  double balance = 0;
  double balanceActual = 0;

  lista.forEach((b){
    ventas += Utils.toDouble(b["ventas"].toString());
    comisiones += Utils.toDouble(b["comisiones"].toString());
    descuentos += Utils.toDouble(b["descuentos"].toString());
    premios += Utils.toDouble(b["premios"].toString());
    totalNeto += Utils.toDouble(b["totalNeto"].toString());
    balance += Utils.toDouble(b["balance"].toString());
    balanceActual += Utils.toDouble(b["balanceActual"].toString());
  });

  Map<String, dynamic> map = {"ventas" : ventas, "comisiones" : comisiones, "descuentos" : descuentos, 
  "premios" : premios, "totalNeto" : totalNeto, "balance" : balance, "balanceActual" :  balanceActual};

  return map;
 }


_getListaFiltro(){
    var mostrarFiltro = false;
    List<MyFilterData> lista = [];
    if(_fecha == null || _limite != 20){
      

        

        if(_fecha == null)
          lista.add(MyFilterData(
            text: MyDate.datesToString(_fechaInicial, _fechaFinal), 
            value: MyDate.datesToString(_fechaInicial, _fechaFinal), 
            color: null,
            onChanged: (data){
              setState(() {
                _fecha = MyDate.hoy;
                _historicoVentas();
              });
            })
          );


          if(_limite != 20)
          lista.add(MyFilterData(
            text: "$_limite filas", 
            value: _limite, 
            color: Colors.green[700],

            onChanged: (data){
              setState(() {
                _limite = 20;
                _historicoVentas();
              });
            })
          );

       
    }else
      lista = [];
    
    return lista;
  }

  _filtroScreen() async {
    var fechaInicial = _fechaInicial;
    var fechaFinal = _fechaFinal;
    var fecha = _fecha;
    var limite = _limite;
    var moneda = _moneda;
    var data = await showDialog(context: context, builder: (context){
      _back({sendData = false}){
        var map;
        if(sendData)
          map = {
            "fecha" : fecha,
            "fechaInicial" : fechaInicial,
            "fechaFinal" : fechaFinal,
            "limite" : limite,
            "moneda" : moneda,
          };

        Navigator.pop(context, map);
      }
  
      return StatefulBuilder(
        builder: (context, setState) {
          _fechaChanged(MyDate tmpFecha){
    var tmpFechaInicial;
    var tmpFechaFinal;
    switch (tmpFecha) {
      case MyDate.hoy:
        var fechas = MyDate.getHoy();
        tmpFechaInicial = fechas[0];
        tmpFechaFinal = fechas[1];
        break;
      case MyDate.ayer:
        var fechas = MyDate.getAyer();
        tmpFechaInicial = fechas[0];
        tmpFechaFinal = fechas[1];
        break;
      case MyDate.estaSemana:
        var fechas = MyDate.getEstaSemana();
        tmpFechaInicial = fechas[0];
        tmpFechaFinal = fechas[1];
        break;
       case MyDate.ultimos2Dias:
        var fechas = MyDate.getUltimos2Dias();
        tmpFechaInicial = fechas[0];
        tmpFechaFinal = fechas[1];
        break;
      case MyDate.esteMes:
        var fechas = MyDate.getEsteMes();
        tmpFechaInicial = fechas[0];
        tmpFechaFinal = fechas[1];
        break;
      default:
        var fechas = MyDate.getSemanaPasada();
        tmpFechaInicial = fechas[0];
        tmpFechaFinal = fechas[1];
     
    }

    setState(() {
      fecha = tmpFecha;
      fechaInicial = tmpFechaInicial;
      fechaFinal = tmpFechaFinal;
    });
  }
 

          _seleccionarFechaSencillaSiPertenece(){
              if(MyDate.isHoy(fechaInicial, fechaFinal))
                fecha = MyDate.hoy;
              else if(MyDate.isAyer(fechaInicial, fechaFinal))
                fecha = MyDate.ayer;
              else if(MyDate.isEstaSemana(fechaInicial, fechaFinal))
                fecha = MyDate.estaSemana;
              else if(MyDate.isSemanaPasada(fechaInicial, fechaFinal))
                fecha = MyDate.laSemanaPasada;
              else if(MyDate.isUltimo2Dias(fechaInicial, fechaFinal))
                fecha = MyDate.ultimos2Dias;
              else if(MyDate.isEsteMes(fechaInicial, fechaFinal))
                fecha = MyDate.esteMes;
              else
                fecha = null;

            }

          _fechaInicialChanged() async {
            DateTime fecha = await showDatePicker(context: context, initialDate: fechaInicial, firstDate: DateTime(2000), lastDate: DateTime(2100));
            if(fecha == null)
              return;
            
            if(fechaInicial != fecha)
              setState(() {
                fechaInicial = (fecha != null) ? fecha : fechaInicial;
                _seleccionarFechaSencillaSiPertenece();
              });

          }

          _fechaFinalChanged() async {
            
            DateTime fecha = await showDatePicker(context: context, initialDate: fechaFinal, firstDate: DateTime(2000), lastDate: DateTime(2100));
            if(fecha == null)
              return;
            
            if(fechaFinal != fecha)
              setState(() {
                fechaFinal = (fecha != null) ? DateTime.parse("${fecha.year}-${Utils.toDosDigitos(fecha.month.toString())}-${Utils.toDosDigitos(fecha.day.toString())} 23:59:59") : fechaFinal;
                _seleccionarFechaSencillaSiPertenece();
              });

          }



          return AlertDialog(
            title: Text("Filtrar"),
            contentPadding: EdgeInsets.only(top: 8, bottom: 0, left: 24, right: 24),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  // Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text("Fecha", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black)),
                  //     ),
                      Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.date_range, size: 24, color: Colors.grey,),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: 
                                  Row(
                                    children: MyDate.listaFechaLarga.map((e) =>  Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: MyContainerButton(
                                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                        selected: e[0] == fecha, data: [e[0], e[1]], onTap: (data){
                                          print("_filtroScreen fecha: ${e[1]}");
                                          _fechaChanged(e[0]);
                                      },),
                                    )).toList(),
                                  ),
                                  
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          dense: true,
                          leading: SizedBox(),
                          onTap: _fechaInicialChanged,
                          title: Text("${_dateFormat != null ? _dateFormat.format(fechaInicial) : DateFormat('EEE, MMM d yyy').format(fechaFinal)}"),
                        ),
                        ListTile(
                          dense: true,
                          leading: SizedBox(),
                          onTap: _fechaFinalChanged,
                          title: Text("${_dateFormat != null ? _dateFormat.format(fechaFinal) : DateFormat('EEE, MMM d yyy').format(fechaFinal)}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Divider(thickness: 1,),
                        ),
                        ListTile(
                          leading: Icon(Icons.attach_money),
                          // title: Text("${_moneda != null ? _moneda.descripcion : ''}"),
                          dense: true,
                          title: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: moneda,
                              // selectedItemBuilder: (context){
                              //   return listaLimite.map((e) => Center(child: Text("$e filas a mostrar"))).toList();
                              // },
                              items: listaMoneda.map((e) => DropdownMenuItem(child: Text("${e.descripcion}"), value: e),).toList(),
                              onChanged: (data){
                                setState(() => moneda = data);
                              },
                            ),
                          ),
                          // onTap: _showMoneda,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Divider(thickness: 1,),
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(Icons.table_rows_rounded),
                          onTap: _fechaFinalChanged,
                          title: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: limite,
                              selectedItemBuilder: (context){
                                return listaLimite.map((e) => Center(child: Text("$e filas a mostrar"))).toList();
                              },
                              items: listaLimite.map((e) => DropdownMenuItem(child: Text("$e"), value: e),).toList(),
                              onChanged: (data){
                                setState(() => limite = data);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Divider(thickness: 1,),
                        ),
                        
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: _back, child: Text("Cancelar")),
              TextButton(onPressed: (){_back(sendData: true);}, child: Text("Filtrar")),
            ],
          );
        }
      );
    });
    if(data == null)
      return;

    if(_fechaInicial == data["fechaInicial"] && _fechaFinal == data["fechaFinal"] && _fecha == data["fecha"] && _limite == data["limite"] && _moneda == data["moneda"])
      return;

    setState(() {
      _fechaInicial = data["fechaInicial"];
      _fechaFinal = data["fechaFinal"];
      _fecha = data["fecha"];
      _limite = data["limite"];
      _moneda = data["moneda"];

      _historicoVentas();
    });
  }


_monedaChanged(moneda){
    setState((){
        _moneda = moneda;
        _historicoVentas();
      });
  }

  _showBottomSheetMoneda() async {
    var data = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context){
        _back(){
              Navigator.pop(context);
            }
            monedaChanged(moneda){
              setState(() => _moneda = moneda);
              _monedaChanged(moneda);
              _back();
            }
        return Container(
              height: 150,
              child: Column(
                children: [
                  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Container(height: 5, width: 40, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5)),)),
                        ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listaMoneda.length,
                      itemBuilder: (context, index){
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,

                          value: _moneda == listaMoneda[index],
                          onChanged: (data){
                            monedaChanged(listaMoneda[index]);
                          },
                          title: Text("${listaMoneda[index].descripcion}",),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
        
      
      }
  );
    // if(data != null)
    //   setState((){
    //     _loteria = data;
    //     _filtrar();
    //   });
  }



  Widget _getBodyWidget(List data) {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 120,
        rightHandSideColumnWidth: 820,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: (context, index) => _generateFirstColumnRow(context, index, data.length, data),
        rightSideItemBuilder: (context, index) => _generateRightHandSideColumnRow(context, index, data.length, data),
        itemCount: data.length + 1,
        rowSeparatorWidget: const Divider(
          color: Colors.transparent,
          height: 0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
        verticalScrollbarStyle: const ScrollbarStyle(
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
        horizontalScrollbarStyle: const ScrollbarStyle(
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
        enablePullToRefresh: false,
        refreshIndicator: const WaterDropHeader(),
        refreshIndicatorHeight: 60,
        // onRefresh: () async {
        //   //Do sth
        //   await Future.delayed(const Duration(milliseconds: 500));
        //   _hdtRefreshController.refreshCompleted();
        // },
        // htdRefreshController: _hdtRefreshController,
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      // TextButton(
      //   style: TextButton.styleFrom(
      //     padding: EdgeInsets.zero,
      //   ),
      //   child: _getTitleItemWidget(
      //       'Banca' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
      //       120),
      //   onPressed: () {
      //     // sortType = sortName;
      //     // isAscending = !isAscending;
      //     // user.sortName(isAscending);
      //     // setState(() {});
      //   },
      // ),
      // TextButton(
      //   style: TextButton.styleFrom(
      //     padding: EdgeInsets.zero,
      //   ),
      //   child: _getTitleItemWidget(
      //       'Ventas' +
      //           (sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''),
      //       120),
      //   onPressed: () {
      //     // sortType = sortStatus;
      //     // isAscending = !isAscending;
      //     // user.sortStatus(isAscending);
      //     // setState(() {});
      //   },
      // ),
      _getTitleItemWidget('Banca', 120),
      _getTitleItemWidget('Ventas.', 120),
      _getTitleItemWidget('Comis.', 120),
      _getTitleItemWidget('Desc.', 100),
      _getTitleItemWidget('Premios', 120),
      _getTitleItemWidget('Neto', 120),
      _getTitleItemWidget('Balance', 120),
      _getTitleItemWidget('Balance mas ventas', 120),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Center(child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
      width: width,
      height: 30,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      color: Utils.colorPrimary,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index, int length, List data) {
    if(index != length)
      return Container(
        child: Center(child: Text(data[index]["descripcion"], style: TextStyle(fontWeight: FontWeight.bold)),),
        width: 120,
        height: 30,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        color: Utils.colorGreyFromPairIndex(idx: index),
      );

    return Container(
      child: Center(child: Text("Totales", style: TextStyle(fontWeight: FontWeight.bold, color: Utils.colorPrimary)),),
      width: 120,
      height: 30,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      color: Utils.colorGreyFromPairIndex(idx: index),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index, int length, List data) {
    if(index != length)
    return Row(
      children: <Widget>[
        Container(
          child: Center(child: Text("${Utils.toCurrency(data[index]["ventas"])}", style: TextStyle(fontWeight: FontWeight.w600))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: Utils.colorGreyFromPairIndex(idx: index),
        ),
        Container(
          child: Center(child: Text("${Utils.toCurrency(data[index]["comisiones"])}", style: TextStyle(fontWeight: FontWeight.w600))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: Utils.colorGreyFromPairIndex(idx: index),
        ),
        Container(
          child: Center(child: Text("${Utils.toCurrency(data[index]["descuentos"])}", style: TextStyle(fontWeight: FontWeight.w600))),
          width: 100,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: Utils.colorGreyFromPairIndex(idx: index),
        ),
        Container(
          child: Center(child: Text("${Utils.toCurrency(data[index]["premios"])}", style: TextStyle(fontWeight: FontWeight.w600))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: Utils.colorGreyFromPairIndex(idx: index),
        ),
        Container(
          color: (Utils.toDouble(data[index]["totalNeto"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa,
          child: Center(child: Text("${Utils.toCurrency(data[index]["totalNeto"])}", style: TextStyle(fontWeight: FontWeight.w600))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Center(child: Text("${Utils.toCurrency(data[index]["balance"])}", style: TextStyle(fontWeight: FontWeight.w600))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: (Utils.toDouble(data[index]["balance"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa,
        ),
        Container(
          child: Center(child: Text("${Utils.toCurrency(data[index]["balanceActual"])}", style: TextStyle(fontWeight: FontWeight.w600))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: (Utils.toDouble(data[index]["balanceActual"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa, 
        ),
      ],
    );

    var totales = _calcularTotal(data);
    return Row(
      children: <Widget>[
        
        Container(
          child: Center(child: Text("${Utils.toCurrency(Utils.redondear(totales["ventas"]))}", style: TextStyle(fontWeight: FontWeight.bold, color: Utils.colorPrimary))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: Utils.colorGreyFromPairIndex(idx: index),
        ),
        Container(
          child: Center(child: Text("${Utils.toCurrency(Utils.redondear(totales["comisiones"]))}", style: TextStyle(fontWeight: FontWeight.bold, color: Utils.colorPrimary))),
          width: 100,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: Utils.colorGreyFromPairIndex(idx: index),
        ),
        Container(
          child: Center(child: Text("${Utils.toCurrency(Utils.redondear(totales["descuentos"]))}", style: TextStyle(fontWeight: FontWeight.bold, color: Utils.colorPrimary))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: Utils.colorGreyFromPairIndex(idx: index),
        ),
        Container(
          child: Center(child: Text("${Utils.toCurrency(Utils.redondear(totales["premios"]))}", style: TextStyle(fontWeight: FontWeight.bold, color: Utils.colorPrimary))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: Utils.colorGreyFromPairIndex(idx: index),
        ),
        Container(
          // color: (Utils.toDouble(listaDinamicaBancas[index]["totalNeto"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa,
          child: Center(child: Text("${Utils.toCurrency(Utils.redondear(totales["totalNeto"]))}", style: TextStyle(fontWeight: FontWeight.bold, color: Utils.colorPrimary))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Center(child: Text("${Utils.toCurrency(Utils.redondear(totales["balance"]))}", style: TextStyle(fontWeight: FontWeight.bold, color: Utils.colorPrimary))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          // color: (Utils.toDouble(listaDinamicaBancas[index]["balance"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa,
        ),
        Container(
          child: Center(child: Text("${Utils.toCurrency(Utils.redondear(totales["balanceActual"]))}", style: TextStyle(fontWeight: FontWeight.bold, color: Utils.colorPrimary))),
          width: 120,
          height: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          // color: (Utils.toDouble(listaDinamicaBancas[index]["balanceActual"].toString()) >= 0) ? Utils.colorInfoClaro : Utils.colorRosa, 
        ),
      ],
    );
  }

    _opcionChanged(opcion){
    setState((){
        _selectedOption = opcion;
        _historicoVentas();
      });
  }

  _showBottomSheetBanca() async {
    // if(_tienePermiso == false)
    //   return;

    var data = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context){
        _back(){
              Navigator.pop(context);
            }
            opcionChanged(opcion){
              setState(() => _selectedOption = opcion);
              _opcionChanged(opcion);
              _back();
            }
        return Container(
              height: MediaQuery.of(context).size.height / 1.3,
              child: Column(
                children: [
                  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Container(height: 5, width: 40, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5)),)),
                        ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listaOpciones.length,
                      itemBuilder: (context, index){
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,

                          value: _selectedOption == listaOpciones[index],
                          onChanged: (data){
                            opcionChanged(listaOpciones[index]);
                          },
                          title: Text("${listaOpciones[index]}"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          
      }
  );
    // if(data != null)
    //   setState((){
    //     _loteria = data;
    //     _filtrar();
    //   });
  }

 _deleteAllFilter(){
    setState(() {
      if(_fecha == null)
        _fecha = MyDate.hoy;

      if(_limite != 20)
        _limite = 20;

      _historicoVentas();
    });
  }


  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: GestureDetector(
        onTap: _showBottomSheetBanca,
        child: Row(
            children: [
              Text("${_selectedOption != null ? _selectedOption : 'No hay opcion'}", style: TextStyle(color: Colors.black),),
              Icon(Icons.arrow_drop_down, color: Colors.black54,)
            ],
          ),
        ),
        leading: BackButton(
          color: Utils.colorPrimary,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
              TextButton(onPressed: _showBottomSheetMoneda, child: Text("${_moneda != null ? _moneda.abreviatura : ''}", style: TextStyle(color: (_moneda != null) ? Utils.fromHex(_moneda.color) : Utils.colorPrimary))),
              IconButton(icon: Icon(Icons.filter_alt_rounded), onPressed: _filtroScreen, color: Utils.colorPrimary,),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
             _getListaFiltro().length == 0
                      ?
                      Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              // child: Icon(Icons.date_range, size: 35, color: Colors.grey,),
                              child: Icon(Icons.date_range, color: Colors.grey,),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: 
                                  Row(
                                    children: MyDate.listaFechaLarga.map((e) =>  Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: MyContainerButton(
                                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                        selected: e[0] == _fecha, data: [e[0], e[1]], onTap: (data){
                                        setState((){
                                          print("_build fecha: ${e[1]}");
                                          _fecha = e[0];
                                          _historicoVentas();
                                        });
                                      },),
                                    )).toList(),
                                  )
                                  
                                ),
                              ),
                            ),
                          ],
                        )
                      :
                      MyFilter(title: "", data: _getListaFiltro(), onDeleteAll: _deleteAllFilter, paddingContainer: EdgeInsets.symmetric(vertical: 8, horizontal: 15),),
            Flexible(
              child: StreamBuilder<List>(
                    stream: _streamControllerHistorio.stream,
                    builder: (context, snapshot) {
                      if(snapshot.data == null)
                        return Center(child: CircularProgressIndicator(),);

                      if(snapshot.hasData && snapshot.data.length == 0 && listaDinamicaBancas.length > 0)
                        return Center(child: MyEmpty(title: "No hay bancas $_selectedOption", icon: Icons.home_work_sharp, titleButton: "No hay bancas",),);

                      return _getBodyWidget(snapshot.data);

                      // return SliverFillRemaining(child: _getBodyWidget(snapshot.data));
                    }
                  ),
            ),
          ],
        )
          
        // CustomScrollView(
        //   slivers: [
        //     // SliverAppBar(
        //     //   backgroundColor: Colors.white,
        //     //   title: GestureDetector(
        //     //   onTap: _showBottomSheetBanca,
        //     //   child: Row(
        //     //       children: [
        //     //         Text("${_selectedOption != null ? _selectedOption : 'No hay opcion'}", style: TextStyle(color: Colors.black),),
        //     //         Icon(Icons.arrow_drop_down, color: Colors.black54,)
        //     //       ],
        //     //     ),
        //     //   ),
        //     //   leading: BackButton(
        //     //     color: Utils.colorPrimary,
        //     //   ),
        //     //   // expandedHeight: 110,
        //     // // floating: true,
        //     // // pinned: true, 
            
        //     // // FlexibleSpaceBar(
        //     // //   // alignment: Alignment.bottomRight,
        //     // //   background: Column(
        //     // //     mainAxisAlignment: MainAxisAlignment.end,
        //     // //     crossAxisAlignment: CrossAxisAlignment.start,
        //     // //     children: [
        //     // //       // Padding(
        //     // //       //   padding: const EdgeInsets.all(8.0),
        //     // //       //   child: Text("Fecha", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black)),
        //     // //       // ),
        //     // //       _getListaFiltro().length == 0
        //     // //       ?
        //     // //       Row(
        //     // //           children: [
        //     // //             Padding(
        //     // //               padding: const EdgeInsets.all(8.0),
        //     // //               // child: Icon(Icons.date_range, size: 35, color: Colors.grey,),
        //     // //               child: Icon(Icons.date_range, color: Colors.grey,),
        //     // //             ),
        //     // //             Expanded(
        //     // //               child: Padding(
        //     // //                 padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        //     // //                 child: SingleChildScrollView(
        //     // //                   scrollDirection: Axis.horizontal,
        //     // //                   child: 
        //     // //                   Row(
        //     // //                     children: MyDate.listaFechaLarga.map((e) =>  Padding(
        //     // //                       padding: const EdgeInsets.all(4.0),
        //     // //                       child: MyContainerButton(
        //     // //                         padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        //     // //                         selected: e[0] == _fecha, data: [e[0], e[1]], onTap: (data){
        //     // //                         setState((){
        //     // //                           print("_build fecha: ${e[1]}");
        //     // //                           _fecha = e[0];
        //     // //                           _historicoVentas();
        //     // //                         });
        //     // //                       },),
        //     // //                     )).toList(),
        //     // //                   )
                              
        //     // //                 ),
        //     // //               ),
        //     // //             ),
        //     // //           ],
        //     // //         )
        //     // //       :
        //     // //       Padding(
        //     // //         padding: const EdgeInsets.only(bottom: 8.0),
        //     // //         child: MyFilter(title: "", data: _getListaFiltro(), onDeleteAll: _deleteAllFilter,),
        //     // //       ),
                  
                  
        //     // //     ],
        //     // //   ),
            
        //     // // ),
            
        //     // ),
             
        //      StreamBuilder<List>(
        //       stream: _streamControllerHistorio.stream,
        //       builder: (context, snapshot) {
        //         if(snapshot.data == null)
        //           return SliverFillRemaining(child: Center(child: CircularProgressIndicator(),));

        //         if(snapshot.hasData && snapshot.data.length == 0 && listaDinamicaBancas.length > 0)
        //           return SliverFillRemaining(child: Center(child: MyEmpty(title: "No hay bancas $_selectedOption", icon: Icons.home_work_sharp, titleButton: "No hay bancas",),));

        //         return SliverList(delegate: SliverChildListDelegate([
        //           Column(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           // Padding(
        //           //   padding: const EdgeInsets.all(8.0),
        //           //   child: Text("Fecha", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black)),
        //           // ),
        //           _getListaFiltro().length == 0
        //           ?
        //           Row(
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.all(8.0),
        //                   // child: Icon(Icons.date_range, size: 35, color: Colors.grey,),
        //                   child: Icon(Icons.date_range, color: Colors.grey,),
        //                 ),
        //                 Expanded(
        //                   child: Padding(
        //                     padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        //                     child: SingleChildScrollView(
        //                       scrollDirection: Axis.horizontal,
        //                       child: 
        //                       Row(
        //                         children: MyDate.listaFechaLarga.map((e) =>  Padding(
        //                           padding: const EdgeInsets.all(4.0),
        //                           child: MyContainerButton(
        //                             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        //                             selected: e[0] == _fecha, data: [e[0], e[1]], onTap: (data){
        //                             setState((){
        //                               print("_build fecha: ${e[1]}");
        //                               _fecha = e[0];
        //                               _historicoVentas();
        //                             });
        //                           },),
        //                         )).toList(),
        //                       )
                              
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             )
        //           :
        //           Padding(
        //             padding: const EdgeInsets.only(bottom: 8.0),
        //             child: MyFilter(title: "", data: _getListaFiltro(), onDeleteAll: _deleteAllFilter,),
        //           ),
                  
                  
        //         ],
        //       ),_getBodyWidget(snapshot.data)
            
        //         ]),);
        //         return SliverFillRemaining(child: _getBodyWidget(snapshot.data));
        //       }
        //     )
          
        //   ],
        // )
        // Column(
        //   children: <Widget>[
        //     Wrap(
        //       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       spacing: 20,
        //       children: <Widget>[
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text("Desde", style: TextStyle(fontSize: 20),),
        //         ),
        //         RaisedButton(
        //           elevation: 0, 
        //           color: Colors.transparent, 
        //           shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 1)),
        //           child: Text("${_fechaInicial.year}-${_fechaInicial.month}-${_fechaInicial.day}", style: TextStyle(fontSize: 16)),
        //           onPressed: () async {
        //             DateTime fecha = await showDatePicker(context: context, initialDate: _fechaInicial, firstDate: DateTime(2000), lastDate: DateTime(2100));
        //             setState(() => _fechaInicial = (fecha != null) ? fecha : _fechaInicial);
        //           },
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text("Hasta", style: TextStyle(fontSize: 20),),
        //         ),
        //         RaisedButton(
        //           elevation: 0,
        //           color: Colors.transparent,
        //           shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 1)),
        //           child: Text("${_fechaFinal.year}-${_fechaFinal.month}-${_fechaFinal.day}", style: TextStyle(fontSize: 16)),
        //           onPressed: () async {
        //             DateTime fecha = await showDatePicker(context: context, initialDate: _fechaFinal, firstDate: DateTime(2000), lastDate: DateTime(2100));
        //             setState(() => _fechaFinal = (fecha != null) ? fecha : _fechaFinal);
        //           },
        //         ),
        //         RaisedButton(
        //           elevation: 0,
        //           color: Utils.fromHex("#e4e6e8"),
        //           child: Text("Buscar", style: TextStyle(color: Utils.colorPrimary),),
        //           onPressed: (){_historicoVentas();},
        //         ),
                
        //       ],
        //     ),
        //     StreamBuilder<List>(
        //       stream: _streamControllerHistorio.stream,
        //       builder: (context, snapshot){
        //         if(snapshot.hasData){
        //           // mapBancas = snapshot.data;
        //           return Flexible(child: _getBodyWidget(snapshot.data));
        //         }
        //         return Flexible(child: _getBodyWidget([]));
        //       },
        //     )
        //   ],
        // ),
      
      ),
    );
  }
}