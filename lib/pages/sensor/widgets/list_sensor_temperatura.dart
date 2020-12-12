import 'package:drawer_menu/models/sensores/temperatura.dart';
import 'package:flutter/material.dart';

class ListSensorTemperatura extends StatelessWidget {
  final List<SensorTemperatura> array;

  ListSensorTemperatura({
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
        onTap: () {},
        leading: index % 2 == 0 ? Icon(Icons.alarm_on) : Icon(Icons.access_alarm),
        title: Text(array[index].referencia),
        subtitle: Text(array[index].resistenciaagua),
        trailing: Icon(Icons.arrow_right),
      );
    },
        ),
      );
  }
}
