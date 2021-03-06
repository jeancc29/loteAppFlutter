import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:loterias/core/classes/database.dart';
import 'package:loterias/core/classes/singleton.dart';
import 'package:loterias/core/classes/utils.dart';
import 'package:loterias/core/models/ajuste.dart';
import 'package:loterias/core/models/bancas.dart';
import 'package:loterias/core/models/permiso.dart';
import 'package:loterias/core/models/servidores.dart';
import 'package:loterias/core/models/usuario.dart';
import 'package:loterias/ui/widgets/showsnackbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService{
  static Future<Map<String, dynamic>> acceder({String usuario, String password, scaffoldkey}) async {
    var map = Map<String, dynamic>();
    var map2 = Map<String, dynamic>();

    map["usuario"] = usuario;
    map["password"] = password;
    map2["datos"] = map;
    final response = await http.post(Utils.URL + '/api/acceder', body: json.encode(map2), headers: Utils.header);
    
    if(response.statusCode < 200 || response.statusCode > 400){
      print('parsed ${response.body}');
      Utils.showSnackBar(scaffoldKey: scaffoldkey, content:"Verifique conexion");
      throw Exception('Failed to load album');
    }
   
      var parsed = await compute(Utils.parseDatos, response.body);
      print("loginserviceAcceder parsed compute: $parsed");
      if(parsed["errores"] == 1){
        if(scaffoldkey != null)
        print("loginservice acceder: $parsed");
        Utils.showSnackBar(scaffoldKey: scaffoldkey, content:parsed["mensaje"] );
        throw Exception('Failed to load usuario datos incorrectos');
      }
      // print('parsed ${parsed['usuario']}');
      // _usuario = Usuario.fromMap(parsed['usuario']);
      // _banca = Banca.fromMap(parsed['bancaObject']);
      // return parsed['usuario'].map<Usuario>((json) => Usuario.fromMap(json)).toList();
      return parsed;
  }

  static Future<Map<String, dynamic>> cambiarServidor({String usuario, String servidor, BuildContext context, scaffoldKey}) async {
    var map = Map<String, dynamic>();
    var map2 = Map<String, dynamic>();

    map["usuario"] = usuario;
    map["servidor"] = servidor;
    var jwt = await Utils.createJwt(map);
    map2["datos"] = jwt;
    final response = await http.post(Utils.URL + '/api/cambiarServidorApi', body: json.encode(map2), headers: Utils.header);
    int statusCode = response.statusCode;
    
    if(statusCode < 200 || statusCode > 400){
      print("loginservice cambiarServidor: ${response.body}");
      if(context != null)
        Utils.showAlertDialog(context: context, content: "Error del servidor loginservice cambiarServidor", title: "Error");
      else
        Utils.showSnackBar(content: "Error del servidor loginservice cambiarServidor", scaffoldKey: scaffoldKey);
      throw Exception("Error del servidor loginservice cambiarServidor");
    }

    var parsed = await compute(Utils.parseDatos, response.body);
    print("loginservice cambiarServidor: ${parsed}");
    if(parsed["errores"] == 1){
      if(context != null)
        Utils.showAlertDialog(context: context, content: parsed["mensaje"], title: "Error");
      else
        Utils.showSnackBar(content: parsed["mensaje"], scaffoldKey: scaffoldKey);
      throw Exception("Error loginservice cambiarServidor: ${parsed["mensaje"]}");
    }
      
      return parsed;
  }

  static guardarDatos(Map<String, dynamic> parsed) async {
    Usuario u = Usuario.fromMap(parsed['usuario']);
    Banca b = Banca.fromMap(parsed['bancaObject']);
    Ajuste a = (parsed['ajustes'] != null) ? Ajuste.fromMap(parsed['ajustes']) : null;
    List<Permiso> permisos = parsed['permisos'].map<Permiso>((json) => Permiso.fromMap(json)).toList();
    List<Servidor> servidores = parsed['servidores'].map<Servidor>((json) => Servidor.fromMap(json)).toList();

    
    await Db.deleteDB();
    await Db.create();
    await Db.open();

    await Db.insert('Users', u.toJson());
    await Db.insert('Branches', b.toJson());
    print("Loginservice guardarDatos: ${a.toJson()}");
    if(a != null)
      await Db.insert("Settings", {
        "id" : a.id, 
        "consorcio" : a.consorcio,
        "idTipoFormatoTicket" : a.tipoFormatoTicket.id,
        "imprimirNombreConsorcio" : a.imprimirNombreConsorcio,
        "descripcionTipoFormatoTicket" : a.tipoFormatoTicket.descripcion,
        "imprimirNombreBanca" : a.imprimirNombreBanca,
        "cancelarTicketWhatsapp" : a.cancelarTicketWhatsapp,
      });
    
    for(Permiso p in permisos){
      await Db.insert('Permissions', p.toJson());
    }

    for(Servidor s in servidores){
      await Db.insert('Servers', s.toJson());
    }


  }
}