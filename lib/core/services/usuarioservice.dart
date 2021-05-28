import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loterias/core/classes/databasesingleton.dart';
import 'package:loterias/core/classes/moor_database.dart';
import 'package:loterias/core/classes/utils.dart';
import 'package:loterias/core/models/usuario.dart';
import 'dart:convert';


class UsuarioService{
  static Future<Map<String, dynamic>> index({@required BuildContext context, scaffoldKey}) async {
    var map = Map<String, dynamic>();
    var mapDatos = Map<String, dynamic>();
    map["servidor"] = await Db.servidor();
    map["idUsuario"] = await Db.idUsuario();
    var jwt = await Utils.createJwt(map);
    var response = await http.get(Uri.parse(Utils.URL + "/api/usuarios?token=$jwt"), headers: Utils.header);
    int statusCode = response.statusCode;

    if(statusCode < 200 || statusCode > 400){
      print("UsuarioService index: ${response.body}");
      var parsed = await compute(Utils.parseDatos, response.body);
      if(context != null)
        Utils.showAlertDialog(context: context, content: "${parsed["message"]}", title: "Error");
      else
        Utils.showSnackBar(content: "Error del servidor UsuarioService index", scaffoldKey: scaffoldKey);
      throw Exception("Error del servidor UsuarioService index");
    }

    var parsed = await compute(Utils.parseDatos, response.body);
      print("UsuarioService index parsed: ${parsed}");

    if(parsed["errores"] == 1){
      if(context != null)
        Utils.showAlertDialog(context: context, content: parsed["mensaje"], title: "Error");
      else
        Utils.showSnackBar(content: parsed["mensaje"], scaffoldKey: scaffoldKey);
      throw Exception("Error UsuarioService index: ${parsed["mensaje"]}");
    }

    return parsed;
  }
 
  static Future<Map<String, dynamic>> guardar({@required BuildContext context, scaffoldKey, @required Usuario usuario}) async {
    var map = Map<String, dynamic>();
    var mapDatos = Map<String, dynamic>();

    map = usuario.toJsonLarge();

    map["idUsuario"] = await Db.idUsuario();
    // map["usuario"] = usuario.toJson();
    map["servidor"] = await Db.servidor();
    var jwt = await Utils.createJwt(map);
    mapDatos["datos"] = jwt;

    var response = await http.post(Uri.parse(Utils.URL + "/api/usuarios/guardar"), body: json.encode(mapDatos), headers: Utils.header);
    int statusCode = response.statusCode;

    if(statusCode < 200 || statusCode > 400){
      print("UsuarioService guardar: ${response.body}");
      var parsed = await compute(Utils.parseDatos, response.body);
      if(context != null)
        Utils.showAlertDialog(context: context, content: "${parsed["message"]}", title: "Error");
      else
        Utils.showSnackBar(content: "Error del servidor UsuarioService guardar", scaffoldKey: scaffoldKey);
      throw Exception("Error del servidor UsuarioService guardar");
    }

    var parsed = await compute(Utils.parseDatos, response.body);
    if(parsed["errores"] == 1){
      if(context != null)
        Utils.showAlertDialog(context: context, content: parsed["mensaje"], title: "Error");
      else
        Utils.showSnackBar(content: parsed["mensaje"], scaffoldKey: scaffoldKey);
      throw Exception("Error UsuarioService guardar: ${parsed["mensaje"]}");
    }

    return parsed;
  }


  static Future<Map<String, dynamic>> eliminar({@required BuildContext context, scaffoldKey, @required Usuario usuario}) async {
    var map = Map<String, dynamic>();
    var mapDatos = Map<String, dynamic>();
    map = usuario.toJson();
    map["idUsuario"] = await Db.idUsuario();
    // map["usuario"] = usuario.toJson();
    map["servidor"] = await Db.servidor();
    var jwt = await Utils.createJwt(map);
    mapDatos["datos"] = jwt;

    var response = await http.post(Uri.parse(Utils.URL + "/api/usuarios/eliminar"), body: json.encode(mapDatos), headers: Utils.header);
    int statusCode = response.statusCode;

    if(statusCode < 200 || statusCode > 400){
      print("UsuarioService guardar: ${response.body}");
      var parsed = await compute(Utils.parseDatos, response.body);
      if(context != null)
        Utils.showAlertDialog(context: context, content: "${parsed["mensaje"]}", title: "Error");
      else
        Utils.showSnackBar(content: "${parsed["mensaje"]}", scaffoldKey: scaffoldKey);
      throw Exception("Error del servidor UsuarioService guardar");
    }

    var parsed = await compute(Utils.parseDatos, response.body);
    if(parsed["errores"] == 1){
      if(context != null)
        Utils.showAlertDialog(context: context, content: parsed["mensaje"], title: "Error");
      else
        Utils.showSnackBar(content: parsed["mensaje"], scaffoldKey: scaffoldKey);
      throw Exception("Error UsuarioService guardar: ${parsed["mensaje"]}");
    }

    return parsed;
  }

}