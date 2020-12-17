import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/mysuperlago.dart';
import 'package:drawer_menu/pages/lakes/pages/add_lake.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../pages/lakes/pages/add_lake.dart';
import 'provider/lake_provider.dart';

class Lagos extends StatefulWidget {
  static const String routeName = "/lagos";

  @override
  _LagosState createState() => _LagosState();
}

class _LagosState extends State<Lagos> {
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
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: width * 0.25,
                          height: 120.0,
                          color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(myLista[index].nombreLago),
                              Text("Nivel de Oxigeno"),
                              Text("Nivel de pH"),
                              Text("Nivel de Agua")
                            ],
                          ),
                        ),
                        Container(
                          width: width * 0.25,
                          height: 120.0,
                          color: Colors.blue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("MIN"),
                              Text(myLista[index]
                                      .minimosensorTemperatura
                                      .toString() +
                                  " C"),
                              Text(myLista[index].minSensorOxigeno.toString() +
                                  "%"),
                              Text(myLista[index].minimosensorPh.toString() +
                                  " PH"),
                              Text(myLista[index].minimoSensorAgua.toString() +
                                  " CM"),
                            ],
                          ),
                        ),
                        Container(
                            width: width * 0.25,
                          height: 120.0,
                          color: Colors.blue,
                          child: GetBuilder<MySuperLago>(
                              init: myLista[index],
                              builder: (mySuperController) => Column(
                                    children: [


                                       Text("ACTUAL"),
                                      if(myLista[index].actualSensorTemperatura ==0)...{
                                        IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          myLista[index].increment();
                                        },
                                      ),
                                      }else...{
                                      Text(myLista[index].actualSensorTemperatura.toString()),
                                      Text(myLista[index].actualSensorOxigeno.toString()),
                                      Text(myLista[index].actualSensorPh.toString()),
                                      Text(myLista[index].actualSensorAgua.toString()),
                                      }
                                     

                                    
                                    ],
                                  )),
                        ),
                        Container(
                          width: width * 0.25,
                          height: 120.0,
                          color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("MAX"),
                              Text(myLista[index]
                                      .maximosensorTemperatura
                                      .toString() +
                                  " C"),
                              Text(myLista[index].maxSensorOxigeno.toString() +
                                  "%"),
                              Text(myLista[index].maximosensorPh.toString() +
                                  " PH"),
                              Text(myLista[index].maximoSensorAgua.toString() +
                                  " CM"),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                );
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
