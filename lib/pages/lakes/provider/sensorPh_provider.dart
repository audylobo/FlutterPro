import 'package:drawer_menu/models/sensores/ph.dart';
import 'package:flutter/material.dart';

class SensorPhProvider with ChangeNotifier {
  

  String textSensorPh = "Seleccionar";
  SensorPH sensorPh;

  set setTextSensorPH(SensorPH dato) {
    this.sensorPh = dato;
    this.textSensorPh = sensorPh.referencia;
    notifyListeners();
  }
  }