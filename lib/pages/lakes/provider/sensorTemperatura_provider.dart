import 'package:drawer_menu/models/sensores/temperatura.dart';
import 'package:flutter/cupertino.dart';

class SentorTemperaturaProvider with ChangeNotifier {

  String textSensorTemperatura = "Seleccionar";
  SensorTemperatura sensorTemperatura;

  set setTextSensorTemperatura(SensorTemperatura dato) {

    this.sensorTemperatura = dato;
    this.textSensorTemperatura = sensorTemperatura.referencia;
    notifyListeners();

  }
  
}
