import 'dart:convert';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/sensores/temperatura.dart';

class StreamSensorTemperatura {
  List<SensorTemperatura> _populares = new List();

  final _popularesStreamController =
      StreamController<List<SensorTemperatura>>.broadcast();

  Function(List<SensorTemperatura>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<SensorTemperatura>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<SensorTemperatura>> getPopulares() async {
    QuerySnapshot querySnapShot = await Firestore.instance
        .collection('sensor temperatura')
        .getDocuments();

    List<SensorTemperatura> array = querySnapShot.documents
        .map((doc) => SensorTemperatura.fromSnapshot(doc))
        .toList();

    _populares.addAll(array);
    popularesSink(_populares);

    return array;
  }


}
