import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FishListOrigin {
  String categoria;
  String description;
  String img;

  FishListOrigin();

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "description": description,
        "img": img,
      };

  FishListOrigin.fromSnapshot(DocumentSnapshot docs)
      : categoria = docs.documentID,
        description = docs['description'],
        img = docs['img'];

  static List<FishListOrigin> toFishList(QuerySnapshot query) {
    return query.documents
        .map((doc) => FishListOrigin.fromSnapshot(doc))
        .toList();
  }
}

class DetailFishModel {
  DetailFishModel({
    this.nombrePez,
    this.nombreCientifico,
    this.nombreEspecie,
    this.continente,
    this.descripcion,
    this.img,
    this.estiloVida,
    this.detalle,
    this.mediciones,
  });

  String nombrePez;
  String nombreCientifico;
  String nombreEspecie;
  String continente;
  String descripcion;
  String img;
  EstiloVida estiloVida;
  Detalle detalle;
  Mediciones mediciones;
/*    FishListOrigin.fromSnapshot(DocumentSnapshot docs)
      : categoria = docs.documentID,
        description = docs['description'],
        img = docs['img'];
 */
   DetailFishModel.fromSnapshot(DocumentSnapshot docs) :
        nombrePez       = docs["nombrePez"],
        nombreCientifico= docs["nombreCientifico"],
        nombreEspecie   = docs["nombreEspecie"],
        continente      = docs["continente"],
        descripcion     = docs["descripcion"],
        img             = docs["img"],
        estiloVida      = EstiloVida.fromMap( docs["estiloVida"]),
        detalle         = Detalle.fromMap(    docs["detalle"]),
        mediciones      = Mediciones.fromMap( docs["mediciones"]);
    

  Map<String, dynamic> toMap() => {
        "nombrePez": nombrePez,
        "nombreCientifico": nombreCientifico,
        "nombreEspecie": nombreEspecie,
        "continente": continente,
        "descripcion": descripcion,
        "img": img,
        "estiloVida": estiloVida.toMap(),
        "detalle": detalle.toMap(),
        "mediciones": mediciones.toMap(),
      };

  DetailFishModel detailFishModelFromMap(String str) => DetailFishModel.fromSnapshot(json.decode(str));

  String detailFishModelToMap(DetailFishModel data) =>
      json.encode(data.toMap());
}

class Detalle {
  Detalle({
    this.pesoMax,
    this.edadMax,
  });

  int pesoMax;
  int edadMax;

  factory Detalle.fromMap(Map<String, dynamic> json) => Detalle(
        pesoMax: json["pesoMax"],
        edadMax: json["edadMax"],
      );

  Map<String, dynamic> toMap() => {
        "pesoMax": pesoMax,
        "edadMax": edadMax,
      };
}

class EstiloVida {
  EstiloVida({
    this.tempMin,
    this.tempMax,
    this.phMax,
    this.phMin,
  });

  int tempMin;
  int tempMax;
  int phMax;
  int phMin;

  factory EstiloVida.fromMap(Map<String, dynamic> json) => EstiloVida(
        tempMin: json["tempMin"],
        tempMax: json["tempMax"],
        phMax: json["phMax"],
        phMin: json["phMin"],
      );

  Map<String, dynamic> toMap() => {
        "tempMin": tempMin,
        "tempMax": tempMax,
        "phMax": phMax,
        "phMin": phMin,
      };
}

class Mediciones {
  Mediciones({
    this.tamanoMin,
    this.tamanoMax,
  });

  int tamanoMin;
  int tamanoMax;

  factory Mediciones.fromMap(Map<String, dynamic> json) => Mediciones(
        tamanoMin: json["tamanoMin"],
        tamanoMax: json["tamanoMax"],
      );

  Map<String, dynamic> toMap() => {
        "tamanoMin": tamanoMin,
        "tamanoMax": tamanoMax,
      };
}
