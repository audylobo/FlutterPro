import 'package:drawer_menu/models/lake_model.dart';
import 'package:drawer_menu/models/sensores/agua.dart';
import 'package:drawer_menu/models/sensores/oxigeno.dart';
import 'package:drawer_menu/models/sensores/ph.dart';
import 'package:drawer_menu/models/sensores/temperatura.dart';
import 'package:drawer_menu/pages/lakes/provider/sensorAgua_provider.dart';
import 'package:drawer_menu/pages/lakes/provider/sensorOxigeno_provider.dart';
import 'package:drawer_menu/pages/lakes/provider/sensorPh_provider.dart';
import 'package:drawer_menu/pages/lakes/provider/sensorTemperatura_provider.dart';
import 'package:drawer_menu/pages/lakes/provider/sensores_providers.dart';
import 'package:drawer_menu/pages/lakes/widgets/textformfield.dart';

import 'package:drawer_menu/services/streams/stream_sensor_temperatura.dart';
import 'package:drawer_menu/widgets/appbar.dart';
import 'package:drawer_menu/widgets/dropdown_dynamic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLakePage extends StatefulWidget {
  final String lakeId;
  final bool isEditing;
  final Map<String, dynamic> lakeData;

  const AddLakePage(
      {Key key, this.lakeId, this.isEditing = false, this.lakeData})
      : super(key: key);

  @override
  _AddLakePageState createState() => _AddLakePageState();
}

class _AddLakePageState extends State<AddLakePage> {
  LakeModel lakeModel = new LakeModel();
  StreamSensorTemperatura futures = new StreamSensorTemperatura();
  SensorProvidersData sensorProvider = new SensorProvidersData();

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      lakeModel = new LakeModel(
          lakeName: widget.lakeData['lakeName'],
          oxigenSendorId: widget.lakeData['oxigen_sendorId'],
          phSensorId: widget.lakeData['ph_sensorId'],
          tempSensorId: widget.lakeData['temp_sensorId'],
          waterLevelSensorId: widget.lakeData['waterLevel_sensorId']);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: CustomBar(
          title: "Crear Lago",
          appBar: AppBar(),
          function: null,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Container(
                width: width,
                child: FormFieldLake(
                  labelText: "Nombre de Lago",
                  controller: sensorProvider.nombreDelLago,
                ),
              ),
              SizedBox(height: 20.0),
              containerPadding(
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.35,
                          child: FormFieldLake(
                            labelText: "Min Sensor Agua",
                            controller: sensorProvider.minSensorAgua,
                          ),
                        ),
                        Container(
                          width: width * 0.35,
                          child: FormFieldLake(
                            labelText: "Max Sensor Agua",
                            controller: sensorProvider.maxSensorAgua,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Container(
                            width: width * 0.20,
                            child: Text("Sensor de Agua: ")),
                        Expanded(
                          child: Consumer<SensorAguaProvider>(
                            builder: (_, provider, __) {
                              return Container(
                                  child: FutureBuilder<List<SensorAgua>>(
                                      future: futures.getSensorAgua(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<SensorAgua>>
                                              snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }

                                        List<SensorAgua> data = snapshot.data;

                                        if (data.length == 0) {
                                          return ListTile(
                                            title: Text('No hay resultados'),
                                          );
                                        }
                                        print("sensor de agua");
                                        return DynamicCustomDropwDownList(
                                          snapshot: data,
                                          textMostrado: provider.textSensorAgua,
                                          functionChange: (value) {
                                            provider.setTextSensorAgua = value;
                                          },
                                        );
                                      }));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              containerPadding(
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.35,
                          child: FormFieldLake(
                            labelText: "Min Sensor Ph",
                            controller: sensorProvider.minSensorPh,
                          ),
                        ),
                        Container(
                          width: width * 0.35,
                          child: FormFieldLake(
                            labelText: "Max Sensor Ph",
                            controller: sensorProvider.maxSensorPh,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Container(
                            width: width * 0.20, child: Text("Sensor de Ph: ")),
                        Expanded(
                          child: Consumer<SensorPhProvider>(
                            builder: (context, providerSensorPh, child) {
                              return Container(
                                  child: FutureBuilder<List<SensorPH>>(
                                      future: futures.getSensorPH(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<SensorPH>>
                                              snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }

                                        List<SensorPH> data = snapshot.data;

                                        if (data.length == 0) {
                                          return ListTile(
                                            title: Text(
                                                'No hay resultados de sensores de PH'),
                                          );
                                        }
                                        print("sensor de PH");
                                        return DynamicCustomDropwDownList(
                                          snapshot: data,
                                          textMostrado:
                                              providerSensorPh.textSensorPh,
                                          functionChange: (value) {
                                            providerSensorPh.setTextSensorPH =
                                                value;
                                          },
                                        );
                                      }));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              containerPadding(
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.35,
                          child: FormFieldLake(
                            labelText: "Min Sensor Oxigeno",
                            controller: sensorProvider.minSensorOxigeno,
                          ),
                        ),
                        Container(
                          width: width * 0.35,
                          child: FormFieldLake(
                            labelText: "Max Sensor Oxigeno",
                            controller: sensorProvider.maxSensorOxigeno,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Container(
                            width: width * 0.20,
                            child: Text("Sensor de Oxigeno: ")),
                        Expanded(
                          child: Consumer<SensorOxigenoProvider>(
                            builder: (context, provider, child) {
                              return Container(
                                  child: FutureBuilder<List<SensorOxigeno>>(
                                      future: futures.getSensoresOxigeno(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<SensorOxigeno>>
                                              snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }

                                        List<SensorOxigeno> data =
                                            snapshot.data;

                                        if (data.length == 0) {
                                          return ListTile(
                                            title: Text(
                                                'No hay resultados de sensores de PH'),
                                          );
                                        }
                                        print("sensor de OXIGENO");
                                        return DynamicCustomDropwDownList(
                                          snapshot: data,
                                          textMostrado:
                                              provider.textSensorOxigeno,
                                          functionChange: (value) {
                                            provider.setTextSensorOxigeno =
                                                value;
                                          },
                                        );
                                      }));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              containerPadding(
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.35,
                          child: FormFieldLake(
                            labelText: "Min Sensor Temperatura",
                            controller: sensorProvider.minSensorTemperatura,
                          ),
                        ),
                        Container(
                          width: width * 0.35,
                          child: FormFieldLake(
                            labelText: "Max Sensor Temperatura",
                            controller: sensorProvider.maxSensorTemperatura,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Container(
                            width: width * 0.20,
                            child: Text("Sensor de Temperatura: ")),
                        Expanded(
                          child: Consumer<SentorTemperaturaProvider>(
                            builder:
                                (context, changeSensorTemperatura1, child) {
                              return Container(
                                  child: FutureBuilder<List<SensorTemperatura>>(
                                      future: futures.getSensoresTemperatura(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<SensorTemperatura>>
                                              snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }

                                        List<SensorTemperatura> data =
                                            snapshot.data;

                                        if (data.length == 0) {
                                          return ListTile(
                                            title: Text(
                                                'No hay resultados de sensores de Temperatura'),
                                          );
                                        }
                                        print("sensor de temperatura");
                                        return DynamicCustomDropwDownList(
                                          snapshot: data,
                                          textMostrado: changeSensorTemperatura1
                                              .textSensorTemperatura,
                                          functionChange: (value) {
                                            changeSensorTemperatura1
                                                    .setTextSensorTemperatura =
                                                value;
                                          },
                                        );
                                      }));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
               SizedBox(height: 20.0),
            
            

            
            
            ]),
          ),
        ));
  }

  Widget containerPadding(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(padding: const EdgeInsets.all(10.0), child: child));
  }
}
