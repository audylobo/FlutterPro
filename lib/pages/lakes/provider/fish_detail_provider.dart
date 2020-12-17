import 'package:drawer_menu/models/fish.dart';
import 'package:drawer_menu/models/lago.dart';

import 'package:flutter/material.dart' show ChangeNotifier;

class FishDetailProvider with ChangeNotifier {
  String texto = "Seleccionar";
  DetailFishModel detallePez;

  set setNombrePez(DetailFishModel dato) {
    this.texto = dato.nombrePez;
    this.detallePez = dato;

    notifyListeners();
  }
}




