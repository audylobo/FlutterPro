import 'package:drawer_menu/models/sensores/ph.dart';

import 'package:flutter/material.dart';

import '../../../routes.dart';

class ListSensorPH extends StatelessWidget {
  final List<SensorPH> array;

  ListSensorPH({
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

                 Navigator.pushNamed(context, Routes.editSensorPH,arguments: array[index]);
            },
            leading: index % 2 == 0
                ? Icon(Icons.nature)
                : Icon(Icons.thermostat_outlined),
            title: Text(array[index].referencia),
            subtitle: Text(array[index].medicion),
            trailing: Icon(Icons.arrow_right),
          );
        },
      ),
    );
  }
}
