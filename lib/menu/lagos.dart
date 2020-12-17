import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/mysuperlago.dart';
import 'package:drawer_menu/pages/lakes/pages/add_lake.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../pages/lakes/pages/add_lake.dart';
import 'provider/lake_provider.dart';

class Lagos extends StatefulWidget {
  static const String routeName = "/lagos";

  @override
  _LagosState createState() => _LagosState();
}

class _LagosState extends State<Lagos> {
  final formatter = DateFormat('yyyy/MM/dd HH:mm a');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddLagePageCreate()));
          }),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: StreamBuilder(
          stream: Firestore.instance
              .collection('lagos')
              .snapshots()
              .map(MySuperLago.toMyLakes),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<MySuperLago> myLista = snapshot.data;

            return ListView.builder(
              itemCount: myLista.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return ListTile(

                    leading: Icon(FontAwesomeIcons.water,
                        color: Colors.blue, size: 50.0),
                    subtitle: Column(
                      children: [
                        Table(
                          defaultColumnWidth: FixedColumnWidth(80.0),
                          children: [
                            TableRow(children: [
                              Text('Lago ' + (index + 1).toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.green)),
                              Text('MIN',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.indigo[900])),
                              Text('ACTUAL',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15.0)),
                              Text('MAX',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.red)),
                            ]),
                            TableRow(children: [
                              Text('Temperatura'),
                              Text(
                                  myLista[index]
                                          .minimosensorTemperatura
                                          .toString() +
                                      " C",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.indigo[900])),
                              GetBuilder<MySuperLago>(
                                  init: myLista[index],
                                  builder: (mySuperController) => Column(
                                        children: [
                                          if (myLista[index]
                                                  .actualSensorTemperatura ==
                                              0) ...{
                                            GestureDetector(
                                              onTap: () {
                                                myLista[index].increment();
                                              },
                                              child: Icon(Icons.add),
                                            ),
                                          } else ...{
                                            Text(
                                              myLista[index]
                                                  .actualSensorTemperatura
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          }
                                        ],
                                      )),
                              Text(
                                  myLista[index]
                                          .maximosensorTemperatura
                                          .toString() +
                                      " C",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red)),
                            ]),
                            TableRow(children: [
                              Text('Nivel de Oxigeno'),
                              Text(
                                  myLista[index].minSensorOxigeno.toString() +
                                      "%",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.indigo[900])),
                              GetBuilder<MySuperLago>(
                                  init: myLista[index],
                                  builder: (mySuperController) => Column(
                                        children: [
                                          if (myLista[index]
                                                  .actualSensorTemperatura ==
                                              0)
                                            ...{}
                                          else ...{
                                            Text(
                                              myLista[index]
                                                  .actualSensorOxigeno
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          }
                                        ],
                                      )),
                              Text(
                                  myLista[index].maxSensorOxigeno.toString() +
                                      "%",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red)),
                            ]),
                            TableRow(children: [
                              Text('Nivel de Ph '),
                              Text(
                                  myLista[index].minimosensorPh.toString() +
                                      " PH",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.indigo[900])),
                              GetBuilder<MySuperLago>(
                                  init: myLista[index],
                                  builder: (mySuperController) => Column(
                                        children: [
                                          if (myLista[index]
                                                  .actualSensorTemperatura ==
                                              0)
                                            ...{}
                                          else ...{
                                            Text(
                                              myLista[index]
                                                  .actualSensorPh
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          }
                                        ],
                                      )),
                              Text(
                                  myLista[index].maximosensorPh.toString() +
                                      " PH",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red)),
                            ]),
                            TableRow(children: [
                              Text('Nivel de Agua '),
                              Text(
                                  myLista[index].minimoSensorAgua.toString() +
                                      " CM",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.indigo[900])),
                              GetBuilder<MySuperLago>(
                                  init: myLista[index],
                                  builder: (mySuperController) => Column(
                                        children: [
                                          if (myLista[index]
                                                  .actualSensorTemperatura ==
                                              0)
                                            ...{}
                                          else ...{
                                            Text(
                                              myLista[index]
                                                  .actualSensorAgua
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          }
                                        ],
                                      )),
                              Text(
                                  myLista[index].maximoSensorAgua.toString() +
                                      " CM",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red)),
                            ]),
                          ],
                        ),
                        Container(
                          width:double.infinity,alignment: Alignment.center,
                          color: Colors.blue,
                          child: Text("PECES DEL LAGO",style:TextStyle(color:Colors.white))),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: myLista[index].registrosLagos.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (__, pos) {
                            return ListTile(
                              leading: Image.network(
                                  myLista[index].registrosLagos[pos].pez.img,
                                  height: 20.0),
                              title: Text(
                                myLista[index]
                                    .registrosLagos[pos]
                                    .pez
                                    .nombrePez,
                                style: TextStyle(fontSize: 10),
                              ),
                              subtitle: Column(
                                children: [
                                  Text(
                                    "Cantidad de Peces:" +
                                        myLista[index]
                                            .registrosLagos[pos]
                                            .cantidadPeces
                                            .toString(),
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  //
                                  Text(
                                    "Fecha" +
                                        formatter.format(DateTime.parse(
                                            myLista[index]
                                                .registrosLagos[pos]
                                                .fecha
                                                .toDate()
                                                .toString())),
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ));
              },
            );
          },
        ),

        /*  
           */
      ),
    );
  }
}

/* class MyModel with ChangeNotifier {
  DateTime someValue = DateTime.now();
  Future<void> doSomething() async {
    Timer.periodic(Duration(seconds: 2), (timer) {
      someValue = DateTime.now();
      notifyListeners();
    });
  }
} */

/*    
      */
