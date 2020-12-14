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
