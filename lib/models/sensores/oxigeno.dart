import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SensorOxigeno {
  String idSensorOxigeno;
  String deteccion;
  String precio;
  String precision;
  String referencia;
  String resistenciaAgua;
  String voltaje;
  String urlimage;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "deteccion": deteccion,
        "precision": precision,
        "referencia": referencia,
        "resistenciaAgua": resistenciaAgua,
        "voltaje": voltaje,
        "precio": precio,
        "url_image": urlimage,
      };

  SensorOxigeno.fromSnapshot(DocumentSnapshot docs)
      : idSensorOxigeno = docs.documentID,
        deteccion = docs['deteccion'],
        precio = docs['precio'],
        precision = docs['precision'],
        referencia = docs['referencia'],
        resistenciaAgua = docs['resistencia_agua'],
        voltaje = docs['voltaje'],
        urlimage = docs['url_image'];

  SensorOxigeno.fromMap(Map<String, dynamic> docs)
      : deteccion = docs['deteccion'],
        precio = docs['precio'],
        precision = docs['precision'],
        referencia = docs['referencia'],
        resistenciaAgua = docs['resistencia_agua'],
        voltaje = docs['voltaje'],
        urlimage = docs['url_image'];

  List<SensorOxigeno> toSensorTemperaturaList(QuerySnapshot query) {
    return query.documents
        .map((doc) => SensorOxigeno.fromSnapshot(doc))
        .toList();
  }
}
