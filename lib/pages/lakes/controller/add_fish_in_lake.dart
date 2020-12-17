import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/lago.dart';
import 'package:drawer_menu/pages/lakes/provider/date_provider.dart';
import 'package:drawer_menu/pages/lakes/provider/detalle_pescado.dart';
import 'package:drawer_menu/pages/lakes/provider/fish_detail_provider.dart';
import 'package:drawer_menu/pages/lakes/provider/sensorAgua_provider.dart';
import 'package:drawer_menu/pages/lakes/provider/sensorOxigeno_provider.dart';
import 'package:drawer_menu/pages/lakes/provider/sensorPh_provider.dart';
import 'package:drawer_menu/pages/lakes/provider/sensorTemperatura_provider.dart';
import 'package:drawer_menu/pages/lakes/provider/sensores_providers.dart';
import 'package:drawer_menu/widgets/toast.dart';
import 'package:flutter/material.dart'
    show BuildContext, FormState, GlobalKey, Colors;
import 'package:provider/provider.dart';

class ControllerAddFishListLake {
  CustomToast toast = new CustomToast();
  void agregarPez(
      BuildContext
          context /* , ListFishLakeProvider myFishList,
      DateProvider myDatePick, FishDetailProvider myFishPress, */
      ,
      SensorProvidersData normalData) {
    final myFishList =
        Provider.of<ListFishLakeProvider>(context, listen: false);
    final myDatePick = Provider.of<DateProvider>(context, listen: false);
    final myFishPress = Provider.of<FishDetailProvider>(context, listen: false);

    if (myDatePick.getDate != null && myFishPress.detallePez != null) {
      Lago fish = new Lago();
      //DetailFishModel myDetailFish = new DetailFishModel();
      fish.fecha = myDatePick.getDate;
      fish.cantidadPeces = int.parse(normalData.cantidadPeces.text.trim());

      fish.pez = myFishPress.detallePez;

      myFishList.setListFishLake = fish;
      print(myFishList.getListFish);
    } else {
      print("ELSE");
      print(myDatePick.getDate);
      print(normalData.cantidadPeces.text.trim());
      print(myFishPress.detallePez);
    }
  }

  void agregarLago(BuildContext context, GlobalKey<FormState> key,
      SensorProvidersData sensorProvider) async {
    final myFishList =
        Provider.of<ListFishLakeProvider>(context, listen: false);

    final sensorAgua = Provider.of<SensorAguaProvider>(context, listen: false);
    final sensorPH = Provider.of<SensorPhProvider>(context, listen: false);
    final sensorTemperatura =
        Provider.of<SentorTemperaturaProvider>(context, listen: false);
    final sensorOxigeno =
        Provider.of<SensorOxigenoProvider>(context, listen: false);

    Lago mylago = new Lago();
    List<dynamic> registros = new List<dynamic>();

    /*   if (myFishList.getListFish.length != 0) {
      if (key.currentState.validate()) { */
    /* 

      
    

        mylago.cantidadPeces = int.parse(sensorProvider.cantidadPeces.text);

        mylago.nombreLago = sensorProvider.nombreDelLago.text.trim();  */
    for (var i = 0; i < myFishList.largoCadena; i++) {
      print(myFishList.getListFish[i].toMap().toString());
      print(myFishList.largoCadena.toString());
      registros.add(myFishList.getListFish[i].toMap());
      //
    }

    Firestore.instance
        .collection("lagos")
        .document()
        .setData({
          
          "registros_lagos": registros,       

          "nombre_lago"             :sensorProvider.nombreDelLago.text.trim(),
                   
          "sensorAgua"              : sensorAgua.sensorAgua.toMap(),
          "minimoSensorAgua"        : int.parse(sensorProvider.minSensorAgua.text),
          "maximoSensorAgua"        : int.parse(sensorProvider.maxSensorAgua.text),

          "sensorOxigeno"           : sensorOxigeno.sensorOxigeno.toMap(),
          "minSensorOxigeno"        : int.parse(sensorProvider.minSensorOxigeno.text),
          "maxSensorOxigeno"        : int.parse(sensorProvider.maxSensorOxigeno.text),
          
          "sensorPH"                : sensorPH.sensorPh.toMap(),
          "minimosensorPH"          : int.parse(sensorProvider.minSensorPh.text),
          "maximosensorPH"          : int.parse(sensorProvider.maxSensorPh.text),
           
          "sensorTemperatura"       : sensorTemperatura.sensorTemperatura.toMap(),
          "minimosensorTemperatura" : int.parse(sensorProvider.minSensorTemperatura.text),
          "maximosensorTemperatura" : int.parse(sensorProvider.maxSensorTemperatura.text),


        "actualSensorTemperatura":0,
        "actualSensorPh"         :0,
        "actualSensorAgua"       :0,
        "actualSensorOxigeno"    :0,



          
          }).then((value) {
      toast.show("Lago registrado", Colors.blue, Colors.white);
    }).catchError((error) {
      toast.show("$error", Colors.blue, Colors.white);
    });
    /*   } else {
        toast.show(
            "Debes completar todos los datos.", Colors.red, Colors.white);
      }
    } else {
      toast.show("Agrega por lo menos un pez.", Colors.red, Colors.white);
    } */
  }
}
