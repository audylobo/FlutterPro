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
  DetailFishModel.fromCreate(
    String nombre,
    String nombreCientifico,
    String nombreEspecie,
    String continente,
    String descripcion,
    String img,
     MiEstiloVida estiloVida,
       MiDetallePez detalle,
       MisMediciones mediciones, 
   /* 
  
    */
  )   : nombrePez = nombre,
        nombreCientifico = nombreCientifico,
        nombreEspecie = nombreEspecie,
        continente = continente,
        descripcion = descripcion,
        img = img,
        estiloVida = estiloVida,
          detalle = detalle,
           mediciones = mediciones; 
  
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
  MiEstiloVida estiloVida;
  MiDetallePez detalle;
  MisMediciones mediciones;
/*    FishListOrigin.fromSnapshot(DocumentSnapshot docs)
      : categoria = docs.documentID,
        description = docs['description'],
        img = docs['img'];
 */
  DetailFishModel.fromSnapshot(DocumentSnapshot docs)
      : nombrePez = docs["nombrePez"],
        nombreCientifico = docs["nombreCientifico"],
        nombreEspecie = docs["nombreEspecie"],
        continente = docs["continente"],
        descripcion = docs["descripcion"],
        img = docs["img"],
        estiloVida = MiEstiloVida.fromMap(docs["estiloVida"]),
        detalle = MiDetallePez.fromMap(docs["detalle"]),
        mediciones = MisMediciones.fromMap(docs["mediciones"]);

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

  DetailFishModel detailFishModelFromMap(String str) =>
      DetailFishModel.fromSnapshot(json.decode(str));

  String detailFishModelToMap(DetailFishModel data) =>
      json.encode(data.toMap());
}

class MiDetallePez {
  MiDetallePez({
    this.pesoMax,
    this.edadMax,
  });

  int pesoMax;
  int edadMax;

     MiDetallePez.fromCreate(
int pesoMax,
int edadMax,
  
  )   : pesoMax = pesoMax,
        edadMax = edadMax;

  factory MiDetallePez.fromMap(Map<String, dynamic> json) => MiDetallePez(
        pesoMax: json["pesoMax"],
        edadMax: json["edadMax"],
      );

  Map<String, dynamic> toMap() => {
        "pesoMax": pesoMax,
        "edadMax": edadMax,
      };
}

class MiEstiloVida {
  MiEstiloVida({
    this.tempMin,
    this.tempMax,
    this.phMax,
    this.phMin,
  });

  int tempMin;
  int tempMax;
  int phMax;
  int phMin;
    MiEstiloVida.fromCreate(
    int tempMin,
    int tempMax,
    int phMin,
    int phMax,
  )   : tempMin = tempMin,
        tempMax = tempMax,
        phMin = phMin,
        phMax = phMax;

  factory MiEstiloVida.fromMap(Map<String, dynamic> json) => MiEstiloVida(
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

class MisMediciones {
  MisMediciones({
    this.tamanoMin,
    this.tamanoMax,
  });

  int tamanoMin;
  int tamanoMax;

  MisMediciones.fromCreate(
    int tamanoMin,
    int tamanoMax,
   
  )   : tamanoMin = tamanoMin,
        tamanoMax = tamanoMax;

  factory MisMediciones.fromMap(Map<String, dynamic> json) => MisMediciones(
        tamanoMin: json["tamanoMin"],
        tamanoMax: json["tamanoMax"],
      );

  Map<String, dynamic> toMap() => {
        "tamanoMin": tamanoMin,
        "tamanoMax": tamanoMax,
      };
}
