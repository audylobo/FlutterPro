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

  List<SensorAgua> toSensorTemperaturaList(QuerySnapshot query) {
    return query.documents.map((doc) => SensorAgua.fromSnapshot(doc)).toList();
  }
}
