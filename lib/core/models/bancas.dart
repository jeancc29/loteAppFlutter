
import 'package:loterias/core/classes/utils.dart';

class Banca {
  int id;
  String descripcion;
  String codigo;
  int status;
  int idMoneda;
  String moneda;
  double descontar;
  double deCada;

  Banca({this.id, this.descripcion, this.codigo, this.status, this.idMoneda, this.moneda, this.descontar, this.deCada});

  Banca.fromMap(Map snapshot) :
        id = snapshot['id'] ?? 0,
        descripcion = snapshot['descripcion'] ?? '',
        codigo = snapshot['codigo'] ?? '',
        status = snapshot['status'] ?? 1,
        idMoneda = snapshot['idMoneda'] ?? 1,
        moneda = snapshot['moneda'] ?? '',
        descontar = Utils.toDouble(snapshot['descontar'].toString()) ?? 0.0,
        deCada = Utils.toDouble(snapshot['deCada'].toString()) ?? 0.0
        ;

  toJson() {
    return {
      "id": id,
      "descripcion": descripcion,
      "codigo": codigo,
      "status": status,
      "idMoneda": idMoneda,
      "moneda": moneda,
      "descontar": descontar,
      "deCada": deCada,
    };
  }
}