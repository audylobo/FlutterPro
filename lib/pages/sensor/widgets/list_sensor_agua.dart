import 'package:drawer_menu/models/sensores/agua.dart';

import 'package:flutter/material.dart';

import '../../../routes.dart';

import 'package:provider/provider.dart';
import 'package:drawer_menu/models/user_model.dart';

class ListSensorAgua extends StatelessWidget {
  final List<SensorAgua> array;

  ListSensorAgua({
    @required this.array,
  });
  @override
  Widget build(BuildContext context) {
     final user = Provider.of<User>(context, listen: false);
    return Container(
      height: 400,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: array.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
               if (user.userActual.rol == "admin") {
               Navigator.pushNamed(context, Routes.editEditNivelAgua,arguments: array[index]);
              }
             
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