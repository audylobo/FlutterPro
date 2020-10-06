import 'package:drawer_menu/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:drawer_menu/menu/sensores/sensorA.dart';

class Sensor extends StatefulWidget {
  static const String routeName = "/sensores";

  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Sensor de temperatura',
      style: optionStyle,
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
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.thermometerEmpty),
            title: Text('Temperatura'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.wind),
            title: Text('Oxigeno'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.chartBar),
            title: Text('PH'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ruler),
            title: Text('Nivel de agua'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
