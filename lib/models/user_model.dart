import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String uid;
  final String email;
  final String name;
  final String rol;
  final dynamic picture;

  User({
    this.uid,
    this.email,
    this.name,
    this.picture,
    this.rol,
  });

  User userActual;

  get user {
    return userActual;
  }

  set setUsuario(User user) {
    print(user.email);
    this.userActual = user;
    print(user.rol);
    notifyListeners();
  }

  User.fromSnapshot(DocumentSnapshot docs)
      : uid = docs.documentID,
        name = docs['name'],
        email = docs['email'],
        rol = docs['rol'],
        picture = docs['picture'];
}
