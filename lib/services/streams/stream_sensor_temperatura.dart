import 'dart:convert';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/reporte.dart';
import 'package:drawer_menu/models/sensores/agua.dart';
import 'package:drawer_menu/models/sensores/oxigeno.dart';
import 'package:drawer_menu/models/sensores/ph.dart';
import 'package:drawer_menu/models/sensores/temperatura.dart';

import '../../models/fish.dart';
import 'package:drawer_menu/models/user_model.dart';

class StreamSensorTemperatura {
  Future<List<User>> getAllUser() async {
    QuerySnapshot querySnapShot =
        await Firestore.instance.collection('users').getDocuments();

    List<User> array =
        querySnapShot.documents.map((doc) => User.fromSnapshot(doc)).toList();

    return array;
  }

  Future<List<FishListOrigin>> getCategoriaPeces() async {
    QuerySnapshot querySnapShot =
        await Firestore.instance.collection('fish').getDocuments();

    List<FishListOrigin> array = querySnapShot.documents
        .map((doc) => FishListOrigin.fromSnapshot(doc))
        .toList();
    print(array);

    return array;
  }

  Future<List<Reporte>> getReportes() async {
    QuerySnapshot querySnapShot =
        await Firestore.instance.collection('reports').getDocuments();

    List<Reporte> array = querySnapShot.documents
        .map((doc) => Reporte.fromSnapshot(doc))
        .toList();
    print(array);

    return array;
  }

  Future<List<SensorTemperatura>> getSensoresTemperatura() async {
    QuerySnapshot querySnapShot = await Firestore.instance
        .collection('sensor temperatura')
        .getDocuments();

    List<SensorTemperatura> array = querySnapShot.documents
        .map((doc) => SensorTemperatura.fromSnapshot(doc))
        .toList();
    print(array);

    return array;
  }

  Future<List<SensorOxigeno>> getSensoresOxigeno() async {
    QuerySnapshot querySnapShot =
        await Firestore.instance.collection('sensor oxigeno').getDocuments();

    List<SensorOxigeno> array = querySnapShot.documents
        .map((doc) => SensorOxigeno.fromSnapshot(doc))
        .toList();
    print(array);

    return array;
  }

  Future<List<SensorPH>> getSensorPH() async {
    QuerySnapshot querySnapShot =
        await Firestore.instance.collection('sensor ph').getDocuments();

    List<SensorPH> array = querySnapShot.documents
        .map((doc) => SensorPH.fromSnapshot(doc))
        .toList();
    print(array);

    return array;
  }

  Future<List<SensorAgua>> getSensorAgua() async {
    QuerySnapshot querySnapShot =
        await Firestore.instance.collection('sensor agua').getDocuments();

    List<SensorAgua> array = querySnapShot.documents
        .map((doc) => SensorAgua.fromSnapshot(doc))
        .toList();
    print(array);

    return array;
  }
}
