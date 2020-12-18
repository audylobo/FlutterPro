import 'package:cloud_firestore/cloud_firestore.dart';

import 'fish.dart';
import 'sensores/agua.dart';
import 'sensores/oxigeno.dart';
import 'sensores/ph.dart';
import 'sensores/temperatura.dart';

class Lago {
  String idLago;
  String nombreLago;
  DetailFishModel pez = new DetailFishModel();
  List<DetailFishModel> myListaPeces;
  DateTime fecha;
  int cantidadPeces;
  SensorAgua sensorAgua;

  int maximoSensorAgua;
  int minimoSensorAgua;

  SensorOxigeno sensorOxigeno;
  int maximosensorOxigeno;
  int minimosensorOxigeno;

  SensorPH sensorPH;
  int maximosensorPH;
  int minimosensorPH;

  SensorTemperatura sensorTemperatura;
  int maximosensorTemperatura;
  int minimosensorTemperatura;

  Map<String, dynamic> toMap() => {

        "fecha"             : fecha,
        "cantidadPeces"     : cantidadPeces,
        "pez": pez.toMap()

      };



}
