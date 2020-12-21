import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/sensores/oxigeno.dart';
import 'package:drawer_menu/models/sensores/ph.dart';
import 'package:drawer_menu/models/sensores/temperatura.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'sensores/agua.dart';

MySuperLago mySuperLagoFromMap(String str) =>
    MySuperLago.fromMap(json.decode(str));

String mySuperLagoToMap(MySuperLago data) => json.encode(data.toMap());

class MySuperLago extends GetxController {
 
  String id;
  String nombreLago;
  SensorAgua sensorAgua;
  SensorOxigeno sensorOxigeno;
  SensorPH sensorPh;
  SensorTemperatura sensorTemperatura;
  int minimoSensorAgua;
  int maximoSensorAgua;
  int minSensorOxigeno;
  int maxSensorOxigeno;
  int minimosensorPh;
  int maximosensorPh;
  int minimosensorTemperatura;
  int maximosensorTemperatura;

  int actualSensorTemperatura = 0;
  int actualSensorPh;
  int actualSensorAgua;
  int actualSensorOxigeno;

  int prueba;
  List<RegistrosLago> registrosLagos;

  int randomNumber;

   MySuperLago({
    this.id,
    this.nombreLago,
    this.sensorAgua,
    this.minimoSensorAgua,
    this.maximoSensorAgua,
    this.minSensorOxigeno,
    this.maxSensorOxigeno,
    this.minimosensorPh,
    this.maximosensorPh,
    this.minimosensorTemperatura,
    this.maximosensorTemperatura,
    this.registrosLagos,
    this.sensorOxigeno,
    this.sensorPh,
    this.sensorTemperatura,
    this.prueba,
    this.actualSensorTemperatura,
    this.actualSensorPh,
    this.actualSensorAgua,
    this.actualSensorOxigeno,
  });

  Future<void> increment() async {
    Timer.periodic(Duration(seconds: 3), (timer) {
      randomNumber = Random().nextInt(50) + 1;
      actualSensorTemperatura = randomNumber;
      randomNumber = Random().nextInt(50) + 1;
      actualSensorPh = randomNumber;
      randomNumber = Random().nextInt(50) + 1;
      actualSensorAgua = randomNumber;
      randomNumber = Random().nextInt(50) + 1;
      actualSensorOxigeno = randomNumber;

      update();
      showSnackBar(
          color: Colors.green,
          message: "Alerta creada",
          title: "Datos a revisar");
      alerDialog(title: "ALERTA!");
      //print(actualSensorTemperatura.toString());
    });
  }

  void showSnackBar({
    String title,
    String message,
    Color color,
  }) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: color,
        colorText: Colors.white);
  }

  void alerDialog({String title}) {
    Get.dialog(AlertDialog(
      title: Text("$title"),
      content: Container(
        width: Get.context.width * 0.80,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.assignment_turned_in, color: Colors.green, size: 25),
            if (actualSensorTemperatura > maximosensorTemperatura) ...{
              Icon(Icons.cloud, color: Colors.blue, size: 25),
              Text(
                "Sensor temperatura actual: " +
                    actualSensorTemperatura.toString(),
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "  Temperatura Max sensor: " +
                    maximosensorTemperatura.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            } else ...{
              Icon(Icons.device_thermostat, color: Colors.red, size: 25),
              Text(
                "Sensor temperatura actual: " +
                    actualSensorTemperatura.toString(),
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "  Temperatura Min sensor: " +
                    minimosensorTemperatura.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            },
            if (actualSensorAgua > maximoSensorAgua) ...{
              Icon(Icons.cloud, color: Colors.blue, size: 25),
              Text(
                "Sensor Agua actual: " + actualSensorAgua.toString(),
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "  Temperatura Max sensor: " + maximoSensorAgua.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            } else ...{
              Icon(Icons.device_thermostat, color: Colors.red, size: 25),
              Text(
                "Sensor Agua actual: " + actualSensorAgua.toString(),
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "  Temperatura Min sensor: " + minimoSensorAgua.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            },
            if (actualSensorOxigeno > maxSensorOxigeno) ...{
              Icon(Icons.cloud, color: Colors.blue, size: 25),
              Text(
                "Sensor Oxigeno actual: " + actualSensorOxigeno.toString(),
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "  Temperatura Max sensor: " + maxSensorOxigeno.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            } else ...{
              Icon(Icons.device_thermostat, color: Colors.red, size: 25),
              Text(
                "Sensor Oxigeno actual: " + actualSensorOxigeno.toString(),
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "  Temperatura Min sensor: " + minSensorOxigeno.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            },
            if (actualSensorPh > maxSensorOxigeno) ...{
              Icon(Icons.cloud, color: Colors.blue, size: 25),
              Text(
                "Sensor PH actual: " + actualSensorPh.toString(),
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "  Temperatura Max sensor: " + maximosensorPh.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            } else ...{
              Icon(Icons.device_thermostat, color: Colors.red, size: 25),
              Text(
                "Sensor PH actual: " + actualSensorPh.toString(),
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "  Temperatura Min sensor: " + minimosensorPh.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            },
          ],
        ),
      ),
      actions: [
        MaterialButton(
          color: Colors.red,
          elevation: 10.0,
          onPressed: () {
            Get.back();
          },
          child: Text("OK"),
        )
      ],
    ));
  }

  factory MySuperLago.fromMap(DocumentSnapshot json) => MySuperLago(
        id       : json.documentID,
        nombreLago: json["nombre_lago"],
        sensorAgua: SensorAgua.fromMap(json["sensorAgua"]),
        sensorPh: SensorPH.fromMap(json["sensorPH"]),
        sensorOxigeno: SensorOxigeno.fromMap(json["sensorOxigeno"]),
        sensorTemperatura: SensorTemperatura.fromMap(json["sensorTemperatura"]),
        actualSensorTemperatura: json["actualSensorTemperatura"],
        actualSensorPh: json["actualSensorPh"],
        actualSensorAgua: json["actualSensorAgua"],
        actualSensorOxigeno: json["actualSensorOxigeno"],
        minimoSensorAgua: json["minimoSensorAgua"],
        maximoSensorAgua: json["maximoSensorAgua"],
        minSensorOxigeno: json["minSensorOxigeno"],
        maxSensorOxigeno: json["maxSensorOxigeno"],
        minimosensorPh: json["minimosensorPH"],
        maximosensorPh: json["maximosensorPH"],
        minimosensorTemperatura: json["minimosensorTemperatura"],
        maximosensorTemperatura: json["maximosensorTemperatura"],
        registrosLagos: List<RegistrosLago>.from(
            json["registros_lagos"].map((x) => RegistrosLago.fromMap(x))),
      );


        factory MySuperLago.fromDocument(Map<String,dynamic> json) => MySuperLago(

        
        nombreLago: json["nombre_lago"],
        sensorAgua: SensorAgua.fromMap(json["sensorAgua"]),
        sensorPh: SensorPH.fromMap(json["sensorPH"]),
        sensorOxigeno: SensorOxigeno.fromMap(json["sensorOxigeno"]),
        sensorTemperatura: SensorTemperatura.fromMap(json["sensorTemperatura"]),
        actualSensorTemperatura: json["actualSensorTemperatura"],
        actualSensorPh: json["actualSensorPh"],
        actualSensorAgua: json["actualSensorAgua"],
        actualSensorOxigeno: json["actualSensorOxigeno"],
        minimoSensorAgua: json["minimoSensorAgua"],
        maximoSensorAgua: json["maximoSensorAgua"],
        minSensorOxigeno: json["minSensorOxigeno"],
        maxSensorOxigeno: json["maxSensorOxigeno"],
        minimosensorPh: json["minimosensorPH"],
        maximosensorPh: json["maximosensorPH"],
        minimosensorTemperatura: json["minimosensorTemperatura"],
        maximosensorTemperatura: json["maximosensorTemperatura"],
        registrosLagos: List<RegistrosLago>.from(
            json["registros_lagos"].map((x) => RegistrosLago.fromMap(x))),
      );


  Map<String, dynamic> toMap() => {
        "nombre_lago": nombreLago,
        "sensorAgua": sensorAgua.toMap(),
        "sensorOxigeno": sensorOxigeno.toMap(),
        "minimoSensorAgua": minimoSensorAgua,
        "maximoSensorAgua": maximoSensorAgua,
        "minSensorOxigeno": minSensorOxigeno,
        "maxSensorOxigeno": maxSensorOxigeno,
        "minimosensorPH": minimosensorPh,
        "maximosensorPH": maximosensorPh,
        "actualSensorTemperatura": actualSensorTemperatura,
        "actualSensorPh": actualSensorPh,
        "actualSensorAgua": actualSensorAgua,
        "actualSensorOxigeno": actualSensorOxigeno,
        "minimosensorTemperatura": minimosensorTemperatura,
        "maximosensorTemperatura": maximosensorTemperatura,
        "registros_lagos":
            List<dynamic>.from(registrosLagos.map((x) => x.toMap())),
      };
  static List<MySuperLago> toMyLakes(QuerySnapshot query) {
    return query.documents.map((doc) => MySuperLago.fromMap(doc)).toList();
  }
}

class RegistrosLago {
  RegistrosLago({
    this.pez,
    this.cantidadPeces,
    this.fecha,
  });

  Pez pez;
  int cantidadPeces;
  Timestamp fecha;

  factory RegistrosLago.fromMap(Map<String, dynamic> json) => RegistrosLago(
        pez: Pez.fromMap(json["pez"]),
        cantidadPeces: json["cantidadPeces"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toMap() => {
        "pez": pez.toMap(),
        "cantidadPeces": cantidadPeces,
        "fecha": fecha,
      };
}

class Pez {
  Pez({
    this.nombrePez,
    this.nombreCientifico,
    this.nombreEspecie,
    this.continente,
    this.estiloVida,
    this.detalle,
    this.mediciones,
    this.descripcion,
    this.img,
  });

  String nombrePez;
  String nombreCientifico;
  String nombreEspecie;
  String continente;
  MiVida estiloVida;
  Detalle detalle;
  Mediciones mediciones;
  String descripcion;
  String img;

  factory Pez.fromMap(Map<String, dynamic> json) => Pez(
        nombrePez: json["nombrePez"],
        nombreCientifico: json["nombreCientifico"],
        nombreEspecie: json["nombreEspecie"],
        continente: json["continente"],
        estiloVida: MiVida.fromMap(json["estiloVida"]),
        detalle: Detalle.fromMap(json["detalle"]),
        mediciones: Mediciones.fromMap(json["mediciones"]),
        descripcion: json["descripcion"],
        img: json["img"],
      );

  Map<String, dynamic> toMap() => {
        "nombrePez": nombrePez,
        "nombreCientifico": nombreCientifico,
        "nombreEspecie": nombreEspecie,
        "continente": continente,
        "estiloVida": estiloVida.toMap(),
        "detalle": detalle.toMap(),
        "mediciones": mediciones.toMap(),
        "descripcion": descripcion,
        "img": img,
      };
}

class Detalle {
  Detalle({
    this.pesoMax,
    this.edadMax,
  });

  int pesoMax;
  int edadMax;

  factory Detalle.fromMap(Map<String, dynamic> json) => Detalle(
        pesoMax: json["pesoMax"],
        edadMax: json["edadMax"],
      );

  Map<String, dynamic> toMap() => {
        "pesoMax": pesoMax,
        "edadMax": edadMax,
      };
}

class MiVida {
  MiVida({
    this.tempMin,
    this.tempMax,
    this.phMin,
    this.phMax,
  });

  int tempMin;
  int tempMax;
  int phMin;
  int phMax;

  MiVida.fromCreate(
    int tempMin,
    int tempMax,
    int phMin,
    int phMax,
  )   : tempMin = tempMin,
        tempMax = tempMax,
        phMin = phMin,
        phMax = phMax;
  

  factory MiVida.fromMap(Map<String, dynamic> json) => MiVida(
        tempMin: json["tempMin"],
        tempMax: json["tempMax"],
        phMin: json["phMin"],
        phMax: json["phMax"],
      );

  Map<String, dynamic> toMap() => {
        "tempMin": tempMin,
        "tempMax": tempMax,
        "phMin": phMin,
        "phMax": phMax,
      };
}

class Mediciones {
  Mediciones({
    this.tamanoMin,
    this.tamanoMax,
  });

  int tamanoMin;
  int tamanoMax;

  factory Mediciones.fromMap(Map<String, dynamic> json) => Mediciones(
        tamanoMin: json["tamanoMin"],
        tamanoMax: json["tamanoMax"],
      );

  Map<String, dynamic> toMap() => {
        "tamanoMin": tamanoMin,
        "tamanoMax": tamanoMax,
      };
}
