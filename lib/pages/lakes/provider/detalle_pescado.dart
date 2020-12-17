
  
  import 'package:drawer_menu/models/lago.dart';
import 'package:flutter/material.dart' show ChangeNotifier;
  
  class ListFishLakeProvider with ChangeNotifier {
    
    List<Lago> _listFishLake = List<Lago>();

  get getListFish {
    
    return _listFishLake;

  }

    get largoCadena {
    
    return _listFishLake.length;

  }


  set setListFishLake(Lago pez) {

    this._listFishLake.add(pez);
    notifyListeners();
  } 


  void deletePez(int posicion){


    this._listFishLake.removeAt(posicion);

    notifyListeners();
  }

  
   }