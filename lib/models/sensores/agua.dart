import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SensorAgua {
  String idSensorAgua;
  String corriente;
  String distancia;

  String referencia;
  String resistenciaAgua;
  String voltaje;
  String urlimage;

  String frecuencia;
  String precio;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "frecuencia": frecuencia,
        "precio": precio,
        "corriente": corriente,
        "distancia": distancia,
        "referencia": referencia,
        "resistencia_agua": resistenciaAgua,
        "voltaje": voltaje,
        "url_image": urlimage,
      };

          SensorAgua.fromMap(Map<String, dynamic> json):
        voltaje        = json["voltaje"],
        distancia      = json["distancia"],
        referencia     = json["referencia"],
        precio         = json["precio"],
        resistenciaAgua= json["resistencia_agua"],
        frecuencia     = json["frecuencia"],
        urlimage       = json["url_image"],
        corriente      = json["corriente"];
    

  SensorAgua.fromSnapshot(DocumentSnapshot docs)
      : idSensorAgua = docs.documentID,
        frecuencia = docs['frecuencia'],
        precio = docs['precio'],
        corriente = docs['corriente'],
        distancia = docs['distancia'],
        referencia = docs['referencia'],
        resistenciaAgua = docs['resistencia_agua'],
        voltaje = docs['voltaje'],
        urlimage = docs['url_image'];

  static List<SensorAgua> toSensorAguaList(QuerySnapshot query) {
    return query.documents.map((doc) => SensorAgua.fromSnapshot(doc)).toList();
  }
}
