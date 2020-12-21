import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Reporte {
  String idReporte;
  String email;
  String idLago;
  String idUsuario;
  Timestamp fecha;



 

  Reporte.fromSnapshot(DocumentSnapshot docs)
      : idReporte = docs.documentID,
        email = docs['usuario'],
        idUsuario = docs['uid'],
        idLago = docs['idLago'],
        fecha = docs['fecha_hora']
       ;


  List<Reporte> toReportList(QuerySnapshot query) {
    return query.documents
        .map((doc) => Reporte.fromSnapshot(doc))
        .toList();
  }
}
