import 'package:drawer_menu/models/sensores/temperatura.dart';
import 'package:drawer_menu/pages/sensor/widgets/list_sensor_temperatura.dart';
import 'package:drawer_menu/routes.dart';
import 'package:drawer_menu/services/streams/stream_sensor_temperatura.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sensor extends StatefulWidget {
  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  StreamSensorTemperatura sensorTemperaturaProvider =
      new StreamSensorTemperatura();

  void _onItemTapped(int index) {
    _selectedIndex = index;
   
    setState(() {});
  }

  @override
  void initState() {
   
    super.initState();
  }

  @override
  void dispose() {
    print("DISPOSE");
     sensorTemperaturaProvider?.disposeStreams();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   sensorTemperaturaProvider.getPopulares();
   
    return Scaffold(
      body: [
        StreamBuilder<List<SensorTemperatura>>(
          stream: sensorTemperaturaProvider.popularesStream,
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
        Text(
          'Sensor de oxigeno',
          style: optionStyle,
        ),
        Text(
          'Sensor de Ph',
          style: optionStyle,
        ),
        Text(
          'Sensor de nivel de agua',
          style: optionStyle,
        ),
      ][_selectedIndex],
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.crearSensor);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
