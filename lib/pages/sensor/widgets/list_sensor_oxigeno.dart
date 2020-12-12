import 'package:drawer_menu/models/sensores/oxigeno.dart';
import 'package:drawer_menu/routes.dart';

import 'package:flutter/material.dart';

class ListSensorOxigeno extends StatelessWidget {
  final List<SensorOxigeno> array;

  ListSensorOxigeno({
    @required this.array,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView.builder(
    shrinkWrap: true,
    itemCount: array.length,
    itemBuilder: (context, index) {
      return ListTile(
        onTap: () {

          Navigator.pushNamed(context, Routes.editSensorOxigeno,arguments: array[index]);
        },
        leading: index % 2 == 0 ? Icon(Icons.flaky) : Icon(Icons.thermostat_outlined),
        title: Text(array[index].referencia),
        subtitle: Text(array[index].precio),
        trailing: Icon(Icons.arrow_right),
      );
    },
        ),
      );
  }
}
