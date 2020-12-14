import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/sensor_model.dart';
import 'package:drawer_menu/pages/lakes/pages/add_lake.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:drawer_menu/services/sensor_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/lakes/pages/add_lake.dart';
import '../pages/lakes/pages/add_lake.dart';
import '../pages/lakes/pages/add_lake.dart';
import '../pages/lakes/pages/add_lake.dart';

class Lagos extends StatefulWidget {
  static const String routeName = "/lagos";

  @override
  _LagosState createState() => _LagosState();
}

class _LagosState extends State<Lagos> {
  final double iconSize = 50.0;
  final TextStyle textStyle =
      TextStyle(color: Colors.lightGreen, fontSize: 30.0);

  List<SensorModel> sensorData = [
    SensorService('1').getSensorData(),
    SensorService('1').getSensorData(),
    SensorService('1').getSensorData()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => AddLagePageCreate()));
            }),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              sensorData = [
                SensorService('1').getSensorData(),
                SensorService('1').getSensorData(),
                SensorService('1').getSensorData()
              ];
            });
          },
          child: FutureBuilder(
            future: DatabaseService(null).getLakeList(),
            initialData: new List<DocumentSnapshot>(),
            builder: (BuildContext context,
                AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data.length == 0) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          'assets/images/fish-loading.gif',
                          width: 100.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('No se encontraron resultados')
                    ],
                  ));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return lakeCard(FontAwesomeIcons.water,
                          snapshot.data[index].data, sensorData[0], snapshot.data[index].documentID);
                    },
                  );
                }
              } else {
                return Center(
                    child: SpinKitCircle(
                  color: Colors.blue,
                ));
              }
            },
          ),
        ));
  }

  Widget lakeCard(IconData icon, Map<String, dynamic> data, SensorModel sensorData, String id) {
    final menuButton = new PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: Colors.blue,
        ),
        itemBuilder: (context) => <PopupMenuItem<String>>[
              new PopupMenuItem<String>(
                  child: const Text('Editar'), value: 'edit'),
              new PopupMenuItem<String>(
                  child: const Text('Eliminar'), value: 'delete'),
            ],
        onSelected: (value) {
          if (value == 'edit') {
          /*   Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>  AddLakePage())); */
          } else {
            DatabaseService(null)
                  .deleteLake(id)
                  .then((value) {
                    print(id + ' Deleted');
                    (context as Element).reassemble();
                  });
          }

        });

    return Card(
        child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            icon,
            size: iconSize,
            color: Colors.blue[300],
          ),
          Container(
            width: 200.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(data['lakeName'], style: textStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Temperatura:'),
                    Text('${sensorData.currentTemp}. °C'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Nivel de oxigeno: '),
                    Text('${sensorData.oxiLevel}%'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Nivel de pH:'),
                    Text('${sensorData.phLevel} pH'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Nivel del agua:'),
                    Text('${sensorData.waterLevel} cm'),
                  ],
                ),
              ],
            ),
          ),
          menuButton,
        ],
      ),
    ));
  }
}