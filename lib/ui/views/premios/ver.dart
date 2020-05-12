import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loterias/core/classes/utils.dart';
import 'package:loterias/core/models/loterias.dart';
import 'package:loterias/core/services/premiosservice.dart';
import 'package:rxdart/rxdart.dart';

class VerPremios extends StatefulWidget {
  @override
  _VerPremiosState createState() => _VerPremiosState();
}



class _VerPremiosState extends State<VerPremios> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamController<List<Loteria>> _streamControllerLoteria;
  List<Loteria> listaLoteria = List();
  bool _cargando = false;

  @override
  void initState() {
    // TODO: implement initState
    _streamControllerLoteria = BehaviorSubject();
    _init();
    super.initState();
  }

  _init() async {
  try{
    setState(() => _cargando = true);
    var listaLoteria = await PremiosService.getLoterias(scaffoldKey: _scaffoldKey);
    print("LIsta loteria: ${listaLoteria.length}");
    _streamControllerLoteria.add(listaLoteria);
    setState(() => _cargando = false);
  }on Exception catch(e){
    setState(() => _cargando = false);
  }
}

Padding _card(Loteria loteria){
  print("dentro _card: ${loteria.primera.isEmpty}");
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${loteria.descripcion}", style: TextStyle(fontSize: 20)),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Wrap(
              spacing: 5,
              children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  width: 40,
                  height: 40,
                  color: (loteria.primera.isNotEmpty) ? Colors.blue : Colors.grey,
                  child: Center(
                    child: Text("${(loteria.primera.isNotEmpty) ? loteria.primera : '-'}"),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  width: 40,
                  height: 40,
                  color: (loteria.segunda.isNotEmpty) ? Colors.blue : Colors.grey,
                  child: Center(
                    child: Text("${(loteria.segunda.isNotEmpty) ? loteria.segunda : '-'}"),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  width: 40,
                  height: 40,
                  color: (loteria.tercera.isNotEmpty) ? Colors.blue : Colors.grey,
                  child: Center(
                    child: Text("${(loteria.tercera.isNotEmpty) ? loteria.tercera : '-'}"),
                  ),
                ),
              ),
            ],),
          )
        ],
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // backgroundColor: Colors.white,
        primarySwatch: Utils.colorMaterialCustom,
        accentColor: Colors.pink,
        // accentColor: Utils.fromHex("#F0807F")
      ),
      home: Scaffold(
        body: SafeArea(
          child: StreamBuilder<List<Loteria>>(
            stream: _streamControllerLoteria.stream,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return ListView(
                  children: snapshot.data.map<Padding>((l) => _card(l)).toList(),
                );
              }
              return Center(child: Text("No hay datos"));
            }
          ),
        ),
      ),
    );
  }
}