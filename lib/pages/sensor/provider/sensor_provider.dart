import 'package:flutter/cupertino.dart';

class CreateProviderSensor {

  TextEditingController textNombre = new TextEditingController();
  TextEditingController textDescripcion = new TextEditingController();
  TextEditingController textReferencia = new TextEditingController();
  TextEditingController textVoltaje = new TextEditingController();
  

  String _tipoSensor = "Seleccionar";

  get tipoSensor {
    return _tipoSensor;
  }

  set setTipoSensor(String dato) {
    this._tipoSensor = dato;
  }
}
