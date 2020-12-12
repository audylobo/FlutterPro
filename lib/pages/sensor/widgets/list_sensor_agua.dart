import 'package:drawer_menu/models/sensores/agua.dart';

import 'package:flutter/material.dart';

import '../../../routes.dart';

class ListSensorAgua extends StatelessWidget {
  final List<SensorAgua> array;

  ListSensorAgua({
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
              Navigator.pushNamed(context, Routes.editEditNivelAgua,arguments: array[index]);
            },
            leading: index % 2 == 0
                ? Icon(Icons.report)
                : Icon(Icons.thermostat_outlined),
            title: Text(array[index].referencia),
            subtitle: Text(array[index].precio),
            trailing: Icon(Icons.arrow_right),
          );
        },
      ),
    );
  }
}
