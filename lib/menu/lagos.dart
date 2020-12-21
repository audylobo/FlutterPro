import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/mysuperlago.dart';
import 'package:drawer_menu/pages/lakes/pages/add_lake.dart';
import 'package:drawer_menu/routes.dart';
import 'package:drawer_menu/src/misuper_pdf.dart';
import 'package:drawer_menu/src/pdf.dart';
import 'package:drawer_menu/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:drawer_menu/models/user_model.dart';

class Lagos extends StatefulWidget {
  static const String routeName = "/lagos";

  @override
  _LagosState createState() => _LagosState();
}

class _LagosState extends State<Lagos> {
  CustomToast toast = new CustomToast();
  final formatter = DateFormat('yyyy/MM/dd HH:mm a');

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      floatingActionButton: user.userActual.rol == "admin"
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddLagePageCreate()));
              })
          : Container(),
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
                return Column(children: [
                  ListTile(
                      leading: Icon(FontAwesomeIcons.water,
                          color: Colors.blue, size: 35.0),
                      trailing: user.userActual.rol == "usuario"
                          ? Container(
                              height: 10,
                              width: 10.0,
                            )
                          : PopupMenuButton(
                              icon: Icon(Icons.more_vert),
                              elevation: 10,
                              padding: const EdgeInsets.all(0.0),
                              itemBuilder: (_) => <PopupMenuItem<String>>[
                                    PopupMenuItem<String>(
                                        child: const Text('Editar'),
                                        value: 'edit'),
                                    PopupMenuItem<String>(
                                        child: const Text('Eliminar'),
                                        value: 'delete'),
                                    PopupMenuItem<String>(
                                        child: const Text('Reporte'),
                                        value: 'reporte'),
                                  ],
                              onSelected: (value) {
                                switch (value) {
                                  case 'edit':
                                    if (user.userActual.rol == "admin") {
                                      Navigator.pushNamed(
                                          context, Routes.editarLago,
                                          arguments: myLista[index]);
                                    }

                                    break;
                                  case 'delete':
                                    if (user.userActual.rol == "admin") {
                                      Firestore.instance
                                          .collection("lagos")
                                          .document(myLista[index].id)
                                          .delete()
                                          .then((value) {});
                                    }

                                    break;

                                  case "reporte":
                                    if (user.userActual.rol == "admin" ||
                                        user.userActual.rol == "trabajador") {
                                      Firestore.instance
                                          .collection("reports")
                                          .document()
                                          .setData({
                                        "idLago": myLista[index].id,
                                        "usuario": user.userActual.email,
                                        "uid": user.userActual.uid,
                                        "fecha_hora": DateTime.now(),
                                      }).then((value) {
                                        toast.show("Reporte creado",
                                            Colors.blue, Colors.white);
                                      });
                                      /*   generateDocument(myLista[index]); */
                                    }

                                    break;
                                  default:
                                    break;
                                }
                              }),
                      subtitle: Column(
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          if (user.userActual.rol == "usuario") ...{
                            Container(),
                          } else ...{
                            Table(
                              columnWidths: {
                                0: FixedColumnWidth(120),
                                1: FixedColumnWidth(50),
                                2: FixedColumnWidth(58),
                                3: FixedColumnWidth(50),
                              },
                              // defaultColumnWidth: FixedColumnWidth(80.0),
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
                                      style:
                                          TextStyle(color: Colors.indigo[900])),
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
                                              } else if (myLista[index]
                                                      .actualSensorTemperatura !=
                                                  0) ...{
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
                                      myLista[index]
                                              .minSensorOxigeno
                                              .toString() +
                                          "%",
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Colors.indigo[900])),
                                  GetBuilder<MySuperLago>(
                                      init: myLista[index],
                                      builder: (mySuperController) => Column(
                                            children: [
                                              if (myLista[index]
                                                      .actualSensorTemperatura ==
                                                  0)
                                                ...{}
                                              else if (myLista[index]
                                                      .actualSensorTemperatura !=
                                                  0) ...{
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
                                      myLista[index]
                                              .maxSensorOxigeno
                                              .toString() +
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
                                      style:
                                          TextStyle(color: Colors.indigo[900])),
                                  GetBuilder<MySuperLago>(
                                      init: myLista[index],
                                      builder: (mySuperController) => Column(
                                            children: [
                                              if (myLista[index]
                                                      .actualSensorTemperatura ==
                                                  0)
                                                ...{}
                                              else if (myLista[index]
                                                      .actualSensorTemperatura !=
                                                  0) ...{
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
                                      myLista[index]
                                              .minimoSensorAgua
                                              .toString() +
                                          " CM",
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Colors.indigo[900])),
                                  GetBuilder<MySuperLago>(
                                      init: myLista[index],
                                      builder: (mySuperController) => Column(
                                            children: [
                                              if (myLista[index]
                                                      .actualSensorTemperatura ==
                                                  0)
                                                ...{}
                                              else if (myLista[index]
                                                      .actualSensorTemperatura !=
                                                  0) ...{
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
                                      myLista[index]
                                              .maximoSensorAgua
                                              .toString() +
                                          " CM",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red)),
                                ]),
                              ],
                            ),
                          }
                        ],
                      )),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text("PECES DEL LAGO",
                          style: TextStyle(color: Colors.white))),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: myLista[index].registrosLagos.length,
                    itemBuilder: (__, pos) {
                      return ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          child: Image.network(
                            myLista[index].registrosLagos[pos].pez.img,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          myLista[index].registrosLagos[pos].pez.nombrePez,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 15),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cantidad de Peces:" +
                                  myLista[index]
                                      .registrosLagos[pos]
                                      .cantidadPeces
                                      .toString(),
                              style: TextStyle(fontSize: 13),
                            ),
                            //
                            Text(
                              "Fecha de Ingreso: " +
                                  formatter.format(DateTime.parse(myLista[index]
                                      .registrosLagos[pos]
                                      .fecha
                                      .toDate()
                                      .toString())),
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ]);
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
