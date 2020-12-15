import 'package:drawer_menu/models/fish.dart';
import 'package:drawer_menu/models/listFishLake.dart';

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



class DateProvider with ChangeNotifier {
  DateTime _date = DateTime.now();

  get getDate {
    return _date;
  }

  set setDate(DateTime dato) {
    this._date = dato;
    notifyListeners();
  }





}


  class ListFishLakeProvider with ChangeNotifier {
    
    List<ListFishLake> _listFishLake = List<ListFishLake>();

  get getListFish {
    
    return _listFishLake;

  }

  set setListFishLake(ListFishLake pez) {

    this._listFishLake.add(pez);
    notifyListeners();
  } 


  void deletePez(int posicion){


    this._listFishLake.removeAt(posicion);

    notifyListeners();
  }

  
   }