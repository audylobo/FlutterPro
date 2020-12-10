import 'package:drawer_menu/models/sensor_model.dart';
import 'dart:math';

class SensorService {
  final String sensorID;
  SensorService(this.sensorID);

  SensorModel getSensorData() {
    return new SensorModel(sensorID, _randomInt(2), _randomInt(2),
        _randomInt(1), _randomInt(2));
  }//asd

  String _randomInt(int length) {
    var rand = new Random();
    return rand.nextInt(30).toString();
  }
}
