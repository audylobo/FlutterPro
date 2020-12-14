

import 'package:drawer_menu/models/fish.dart';

import 'package:flutter/material.dart' show ChangeNotifier;

class FishOriginProvider with ChangeNotifier {

  String textCategoria = "Seleccionar";
 


  set setCategoria(FishListOrigin dato) {
  
    this.textCategoria = dato.categoria;

    notifyListeners();
  }


}
