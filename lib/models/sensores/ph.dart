import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SensorPH {
  String idSensorPH;
  String medicion;

  String precision;
  String referencia;
  String resistenciaAgua;
  String voltaje;
  String urlimage;

  String temperaturaTolerable;
  String tiempoRespuesta;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "temperatura_tolerable": temperaturaTolerable,
        "medicion": medicion,
        "precision": precision,
        "referencia": referencia,
        "resistencia_agua": resistenciaAgua,
        "voltaje": voltaje,
        "tiempo_respuesta": tiempoRespuesta,
        "url_image": urlimage,
      };



  SensorPH.fromMap(Map<String,dynamic> docs)
      : 
        medicion = docs['medicion'],
        tiempoRespuesta = docs['tiempo_respuesta'],
        temperaturaTolerable = docs['temperatura_tolerable'],
        precision = docs['precision'],
        referencia = docs['referencia'],
        resistenciaAgua = docs['resistencia_agua'],
        voltaje = docs['voltaje'],
        urlimage = docs['url_image'];

  SensorPH.fromSnapshot(DocumentSnapshot docs)
      : idSensorPH = docs.documentID,
        medicion = docs['medicion'],
        tiempoRespuesta = docs['tiempo_respuesta'],
        temperaturaTolerable = docs['temperatura_tolerable'],
        precision = docs['precision'],
        referencia = docs['referencia'],
        resistenciaAgua = docs['resistencia_agua'],
        voltaje = docs['voltaje'],
        urlimage = docs['url_image'];

  List<SensorPH> toSensorTemperaturaList(QuerySnapshot query) {
    return query.documents.map((doc) => SensorPH.fromSnapshot(doc)).toList();
  }
}
