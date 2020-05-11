import 'package:flutter/material.dart';
import 'package:loterias/core/classes/utils.dart';
import 'package:loterias/core/services/premiosservice.dart';

class VerPremios extends StatefulWidget {
  @override
  _VerPremiosState createState() => _VerPremiosState();
}



class _VerPremiosState extends State<VerPremios> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _cargando = false;


  _init() async {
  try{
    setState(() => _cargando = true);
    var datos = await PremiosService.getLoterias(scaffoldKey: _scaffoldKey);
    setState(() => _cargando = false);
  }on Exception catch(e){
    setState(() => _cargando = false);
  }
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
          child: ListView(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    Text("Nacional"),
                    Wrap(children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                          child: Center(
                            child: Text("20"),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                          child: Center(
                            child: Text("20"),
                          ),
                        ),
                      ),
                    ],)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}