import 'package:drawer_menu/models/sensores/agua.dart';

import 'package:flutter/cupertino.dart';

class SensorAguaProvider with ChangeNotifier {

  String textSensorAgua = "Seleccionar";
  SensorAgua sensorAgua;


  set setTextSensorAgua(SensorAgua dato) {
    this.sensorAgua = dato;
    this.textSensorAgua = sensorAgua.referencia;
    notifyListeners();
  }


}
