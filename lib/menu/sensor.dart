import 'package:drawer_menu/models/sensores/agua.dart';
import 'package:drawer_menu/models/sensores/oxigeno.dart';
import 'package:drawer_menu/models/sensores/ph.dart';
import 'package:drawer_menu/models/sensores/temperatura.dart';
import 'package:drawer_menu/pages/sensor/widgets/list_sensor_agua.dart';
import 'package:drawer_menu/pages/sensor/widgets/list_sensor_oxigeno.dart';
import 'package:drawer_menu/pages/sensor/widgets/list_sensor_ph.dart';
import 'package:drawer_menu/pages/sensor/widgets/list_sensor_temperatura.dart';
import 'package:drawer_menu/routes.dart';
import 'package:drawer_menu/services/streams/stream_sensor_temperatura.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class Sensor extends StatelessWidget {



  StreamSensorTemperatura sensorTemperaturaProvider = new StreamSensorTemperatura();

  

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Person>(context,listen: true);
    return Consumer<Person>(
      builder: (context, person, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.thermometerEmpty),
                label: ('Temperatura'),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.wind),
                label: ('Oxigeno'),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.chartBar),
                label: ('PH'),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.ruler),
                label: ('Nivel de agua'),
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: person.age,
            onTap: person.increaseAge,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.crearSensor);
            },
            child: Icon(Icons.add),
          ),
        );
      },
      child: [
        FutureBuilder<List<SensorTemperatura>>(
          future: sensorTemperaturaProvider.getSensoresTemperatura(),
          builder: (BuildContext context,
              AsyncSnapshot<List<SensorTemperatura>> snapshot) {
            if (snapshot.hasData) {
              List<SensorTemperatura> list = snapshot.data;
              return ListSensorTemperatura(
                array: list,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        FutureBuilder<List<SensorOxigeno>>(
          future: sensorTemperaturaProvider.getSensoresOxigeno(),
          builder: (BuildContext context,
              AsyncSnapshot<List<SensorOxigeno>> snapshot) {
            if (snapshot.hasData) {
              List<SensorOxigeno> list = snapshot.data;
              return ListSensorOxigeno(
                array: list,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        FutureBuilder<List<SensorPH>>(
          future: sensorTemperaturaProvider.getSensorPH(),
          builder:
              (BuildContext context, AsyncSnapshot<List<SensorPH>> snapshot) {
            if (snapshot.hasData) {
              List<SensorPH> list = snapshot.data;
              return ListSensorPH(
                array: list,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        FutureBuilder<List<SensorAgua>>(
          future: sensorTemperaturaProvider.getSensorAgua(),
          builder:
              (BuildContext context, AsyncSnapshot<List<SensorAgua>> snapshot) {
            if (snapshot.hasData) {
              List<SensorAgua> list = snapshot.data;
              return ListSensorAgua(
                array: list,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ][provider.age],
    );
  }
}

class Person with ChangeNotifier {
  int age = 0;

  void increaseAge(int dato) {
    this.age = dato;
    notifyListeners();
  }
}
