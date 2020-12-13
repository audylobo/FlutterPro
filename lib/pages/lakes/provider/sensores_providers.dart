

import 'package:flutter/material.dart' show TextEditingController; 

class SensorProvidersData{


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

}