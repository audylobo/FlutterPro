



import 'package:flutter/cupertino.dart';

class CreateControllerSensor{


  TextEditingController textNombre = new TextEditingController();

  String _tipoSensor = "Seleccionar";


    

 get tipoSensor {
    return _tipoSensor;
  }

  set setTipoSensor(String dato) {
    this._tipoSensor = dato;

  
  }







}