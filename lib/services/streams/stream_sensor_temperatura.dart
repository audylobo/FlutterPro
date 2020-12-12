import 'dart:convert';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/sensores/temperatura.dart';

class StreamSensorTemperatura {


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


}
