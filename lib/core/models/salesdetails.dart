
import 'package:loterias/core/classes/utils.dart';
import 'package:loterias/core/models/draws.dart';
import 'package:loterias/core/models/loterias.dart';

class Salesdetails {
  BigInt id;
  BigInt idVenta;
  int idLoteria;

  int idSorteo;
  String sorteoDescripcion;
  String jugada;
  double monto;
  double premio;
  double comision;
  int idStock;
  int idLoteriaSuperpale;

  DateTime created_at;
  DateTime updated_at;

  int status;

  Loteria loteria;
  Loteria loteriaSuperPale;
  Draws sorteo;


  Salesdetails({this.id, this.idVenta, this.idLoteria, this.idSorteo, this.jugada, this.monto, this.premio, this.comision, this.idStock, this.created_at, this.updated_at, this.idLoteriaSuperpale, this.status, this.loteria, this.loteriaSuperPale, this.sorteo, this.sorteoDescripcion});

  Salesdetails.fromMap(Map snapshot) :
        id = BigInt.from(snapshot['id']) ?? BigInt.zero,
        idVenta = snapshot['idVenta'] != null ? BigInt.from(snapshot['idVenta']) : BigInt.zero,
        idLoteria = snapshot['idLoteria'] ?? 0,
        idSorteo = snapshot['idSorteo'] ?? 0,
        jugada = snapshot['jugada'] ?? '',
        monto = Utils.toDouble(snapshot['monto'].toString()) ?? 0,
        premio = Utils.toDouble(snapshot['premio'].toString()) ?? 0,
        comision = Utils.toDouble(snapshot['comision'].toString()) ?? 0,
        idStock = Utils.toInt(snapshot['idStock'].toString()) ?? 0,
        created_at = (snapshot['created_at'] != null) ? DateTime.parse(snapshot['created_at']) : null,
        idLoteriaSuperpale = snapshot['idLoteriaSuperpale'] ?? 0,
        status = snapshot['status'] ?? 0,
        loteria = (snapshot["loteria"] != null) ? Loteria.fromMap(Utils.parsedToJsonOrNot(snapshot['loteria'])) : null,
        loteriaSuperPale = (snapshot["loteriaSuperPale"] != null) ? Loteria.fromMap(Utils.parsedToJsonOrNot(snapshot['loteriaSuperPale'])) : null,
        sorteo = (snapshot["sorteo"] != null) ? Draws.fromMap(Utils.parsedToJsonOrNot(snapshot['sorteo'])) : null,
        sorteoDescripcion = snapshot['sorteoDescripcion'] ?? ''
        ;

  static List salesdetailsToJson(List<Salesdetails> lista) {
    List jsonList = [];
    if(lista == null)
      return jsonList;
      
    lista.map((u)=>
      jsonList.add(u.toJson())
    ).toList();
    return jsonList;
  }

  toJson() {
    return {
      "id": id != null ? id.toInt() : null,
      "idVenta": idVenta != null ? idVenta.toInt() : null,
      "idLoteria": idLoteria,
      "idSorteo": idSorteo,
      "jugada": jugada,
      "monto": monto,
      "premio": premio != null ? premio : 0,
      "comision": comision,
      "idStock": idStock,
      "created_at": created_at != null ? created_at.toString() : null,
      "updated_at": updated_at != null ? updated_at.toString() : null,
      "idLoteriaSuperpale": idLoteriaSuperpale != null ? idLoteriaSuperpale : 0,
      "sorteoDescripcion": sorteoDescripcion,
    };
  }
  toJsonFull() {
    return {
      "id": id,
      "idVenta": idVenta != null ? idVenta.toInt() : null,
      "idLoteria": idLoteria,
      "idSorteo": idSorteo,
      "monto": monto,
      "premio": premio,
      "comision": comision,
      "idStock": idStock,
      "created_at": created_at != null ? created_at.toString() : null,
      "updated_at": updated_at != null ? updated_at.toString() : null,
      "idLoteriaSuperpale": idLoteriaSuperpale,
    };
  }
}