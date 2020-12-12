import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SensorTemperatura {
  String idSensorTemperatura;
  String resistenciaagua;
  String referencia;
  String consumo;
  String precio;
  String temperatura;
  String urlimage;

  SensorTemperatura({
    this.resistenciaagua,
    this.referencia,
    this.consumo,
    this.precio,
    this.temperatura,
    this.urlimage,
  });
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "resistencia_agua": resistenciaagua,
        "referencia": referencia,
        "consumo": consumo,
        "precio": precio,
        "temperatura": temperatura,
        "url_image": urlimage,
      };

  SensorTemperatura.fromSnapshot(DocumentSnapshot docs)
      : idSensorTemperatura = docs.documentID,
        resistenciaagua = docs['resistencia_agua'],
        referencia = docs['referencia'],
        consumo = docs['consumo'],
        precio = docs['precio'],
        temperatura = docs['temperatura'],
        urlimage = docs['url_image'];

  List<SensorTemperatura> toSensorTemperaturaList(QuerySnapshot query) {
    return query.documents
        .map((doc) => SensorTemperatura.fromSnapshot(doc))
        .toList();
  }
}
