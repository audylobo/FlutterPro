import 'package:drawer_menu/models/fish.dart';
import 'package:drawer_menu/models/lago.dart';
import 'package:drawer_menu/models/sensores/agua.dart';
import 'package:drawer_menu/models/sensores/oxigeno.dart';
import 'package:drawer_menu/models/sensores/ph.dart';
import 'package:drawer_menu/models/sensores/temperatura.dart';
import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ControllerSuperLago extends GetxController {
  TextEditingController nombreDelLago = new TextEditingController();

  //MIN
  TextEditingController minSensorTemperatura = new TextEditingController();
  TextEditingController minSensorOxigeno = new TextEditingController();
  TextEditingController minSensorPh = new TextEditingController();
  TextEditingController minSensorAgua = new TextEditingController();

  //MAX
  TextEditingController maxSensorTemperatura = new TextEditingController();
  TextEditingController maxSensorOxigeno = new TextEditingController();
  TextEditingController maxSensorPh = new TextEditingController();
  TextEditingController maxSensorAgua = new TextEditingController();

  TextEditingController cantidadPeces = new TextEditingController();

  String textSensorAgua = "Seleccionar";
  SensorAgua sensorAgua;

  String textSensorOxigeno = "Seleccionar";
  SensorOxigeno sensorOxigeno;

  String textSensorPh = "Seleccionar";
  SensorPH sensorPh;

  String textSensorTemperatura = "Seleccionar";
  SensorTemperatura sensorTemperatura;

  String textCategoria = "Seleccionar";

  String texto = "Seleccionar";
  DetailFishModel detallePez;

  List<Lago> _listFishLake = List<Lago>();

   DateTime _date = DateTime.now();

  get getDate {

    if (_date == null) return DateTime.now().toLocal(); 
    return _date?.toLocal();
  }

  set setDate(DateTime dato) {
    this._date = dato;
    update();
  }


  get getListFish {
    return _listFishLake;
  }

  get largoCadena {
    return _listFishLake.length;
  }

  set setListFishLake(Lago pez) {
    this._listFishLake.add(pez);
    update();
  }

  void deletePez(int posicion) {
    this._listFishLake.removeAt(posicion);

    update();
  }

  set setNombrePez(DetailFishModel dato) {
    this.texto = dato.nombrePez;
    this.detallePez = dato;

    update();
  }

  set setCategoria(FishListOrigin dato) {
    this.textCategoria = dato.categoria;

    update();
  }

  set setTextSensorTemperatura(SensorTemperatura dato) {
    this.sensorTemperatura = dato;
    this.textSensorTemperatura = sensorTemperatura.referencia;
    update();
  }

  set setTextSensorPH(SensorPH dato) {
    this.sensorPh = dato;
    this.textSensorPh = sensorPh.referencia;
    update();
  }

  set setTextSensorOxigeno(SensorOxigeno dato) {
    this.sensorOxigeno = dato;
    this.textSensorOxigeno = sensorOxigeno.referencia;
    update();
  }

  set setTextSensorAgua(SensorAgua dato) {
    this.sensorAgua = dato;
    this.textSensorAgua = sensorAgua.referencia;
    update();
  }


  void agregarPez() {
   

    if (this.getDate != null && this.detallePez != null) {
      Lago fish = new Lago();
      //DetailFishModel myDetailFish = new DetailFishModel();
      fish.fecha = this.getDate;
      fish.cantidadPeces = int.parse(this.cantidadPeces.text.trim());

      fish.pez = this.detallePez;

      this.setListFishLake = fish;
      print(this.getListFish);
    } else {
      print("ELSE");
      print(this.getDate);
      print(this.cantidadPeces.text.trim());
      print(this.detallePez);
    }
  }
}
