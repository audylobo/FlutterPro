import 'package:drawer_menu/models/sensores/oxigeno.dart';

import 'package:flutter/material.dart';

class SensorOxigenoProvider with ChangeNotifier {
  

  String textSensorOxigeno = "Seleccionar";
  SensorOxigeno sensorOxigeno;

  set setTextSensorOxigeno(SensorOxigeno dato) {
    this.sensorOxigeno = dato;
    this.textSensorOxigeno = sensorOxigeno.referencia;
    notifyListeners();
  }
  }