import 'dart:io';

import 'package:loterias/core/classes/cross_platform_database/cross_platform_db.dart';
import 'package:loterias/core/classes/database.dart';

class MobileDB implements CrossDB{
  var database;
  // @override
  // QueryExecutor getMoorCrossConstructor() {
  //   // TODO: implement getMoorCrossConstructor
  //   return FlutterQueryExecutor.inDatabaseFolder(path: "db.sqlite", logStatements: true);
  // }

//   @override
//   LazyDatabase openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return VmDatabase(file);
//   });
// }
  @override
  openConnection() async {
  // return FlutterQueryExecutor.inDatabaseFolder(path: "db.sqlite", logStatements: true);
  await DBSqflite.create();
  await DBSqflite.open();
  database = DBSqflite.database;
  return DBSqflite;
}

@override
  deleteDB() async {
  // return FlutterQueryExecutor.inDatabaseFolder(path: "db.sqlite", logStatements: true);
  await DBSqflite.deleteDB();
  return DBSqflite;
}

  @override
  String getPlatform() {
    // TODO: implement getPlatform
    return "Mobile";
  }

  @override
  Future<Map<String, dynamic>> ajustes() {
    // TODO: implement ajustes
    throw UnimplementedError();
  }

  @override
  Future delete(String table, [id]) {
    if(id == null)
      return DBSqflite.database.delete(table);
      
    return DBSqflite.delete(table, id);
  }
  
  @override
  Future<bool> existePermiso(String permiso) {
    // TODO: implement existePermiso
    return DBSqflite.existePermiso(permiso);
  }
  
  @override
  Future<Map<String, dynamic>> getBanca() {
    // TODO: implement getBanca
    return DBSqflite.getBanca();
  }
  
  @override
  Future<Map<String, dynamic>> getUsuario() {
    // TODO: implement getUsuario
    return DBSqflite.getUsuario();
  }
  
  @override
  Future<int> idBanca() {
    // TODO: implement idBanca
    return DBSqflite.idBanca();
  }
  
  @override
  Future<int> idUsuario() {
    // TODO: implement idUsuario
    return DBSqflite.idUsuario();
  }
  
  @override
  Future insert(String table, Map<String, dynamic> dataToMap) {
    // TODO: implement insert
    return DBSqflite.insert(table, dataToMap);
  }
  
  @override
  Future<List<Map<String, dynamic>>> query(String table) {
    // TODO: implement query
    return DBSqflite.query(table);
  }
  
  @override
  Future<String> servidor() {
    // TODO: implement servidor
    return DBSqflite.servidor();
  }
  
  @override
  Future<String> tipoFormatoTicket() {
    // TODO: implement tipoFormatoTicket
    return DBSqflite.tipoFormatoTicket();
  }
  
  @override
  Future update(String table, Map<String, dynamic> dataToMap, id) {
  // TODO: implement update
    return DBSqflite.update(table, dataToMap, id);
  }
  

}


CrossDB getDB() => MobileDB();