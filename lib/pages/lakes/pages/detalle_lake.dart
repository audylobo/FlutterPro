import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/fish.dart';
import 'package:drawer_menu/models/lago.dart';
import 'package:drawer_menu/models/mysuperlago.dart';
import 'package:drawer_menu/models/sensores/agua.dart';
import 'package:drawer_menu/models/sensores/oxigeno.dart';
import 'package:drawer_menu/models/sensores/ph.dart';
import 'package:drawer_menu/models/sensores/temperatura.dart';
import 'package:drawer_menu/pages/lakes/controller/add_fish_in_lake.dart';
import 'package:drawer_menu/pages/lakes/getX/controller_super_lago.dart';
import 'package:drawer_menu/pages/lakes/widgets/date.dart';
import 'package:drawer_menu/pages/lakes/widgets/richText.dart';
import 'package:drawer_menu/pages/lakes/widgets/textformfield.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:drawer_menu/services/streams/stream_sensor_temperatura.dart';
import 'package:drawer_menu/widgets/appbar_actions.dart';
import 'package:drawer_menu/widgets/appbar_add.dart';
import 'package:drawer_menu/widgets/button.dart';
import 'package:drawer_menu/widgets/container/container_blue.dart';
import 'package:drawer_menu/widgets/container/container_padding.dart';
import 'package:drawer_menu/widgets/dropdown_dynamic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DetalleSuperLago extends StatefulWidget {
  final MySuperLago mylago;

  DetalleSuperLago({this.mylago});

  @override
  _DetalleSuperLagoState createState() => _DetalleSuperLagoState();
}

class _DetalleSuperLagoState extends State<DetalleSuperLago> {
  final formkey = new GlobalKey<FormState>();
  final controllerSuperLago = new ControllerSuperLago();
  final futures = new StreamSensorTemperatura();
  final formatter = DateFormat('yyyy/MM/dd HH:mm a');
  final controller = new ControllerAddFishListLake();

  @override
  void initState() {
    super.initState();
    controllerSuperLago.nombreDelLago.text = widget.mylago.nombreLago;

    controllerSuperLago.minSensorAgua.text =
        widget.mylago.minimoSensorAgua.toString();
    controllerSuperLago.maxSensorAgua.text =
        widget.mylago.maximoSensorAgua.toString();
    controllerSuperLago.setTextSensorAgua = widget.mylago.sensorAgua;

    controllerSuperLago.minSensorPh.text =
        widget.mylago.minimosensorPh.toString();
    controllerSuperLago.maxSensorPh.text =
        widget.mylago.maximosensorPh.toString();
    controllerSuperLago.setTextSensorPH = widget.mylago.sensorPh;

    controllerSuperLago.minSensorOxigeno.text =
        widget.mylago.minSensorOxigeno.toString();
    controllerSuperLago.maxSensorOxigeno.text =
        widget.mylago.maxSensorOxigeno.toString();
    controllerSuperLago.setTextSensorOxigeno = widget.mylago.sensorOxigeno;

    controllerSuperLago.minSensorTemperatura.text =
        widget.mylago.minimosensorTemperatura.toString();
    controllerSuperLago.maxSensorTemperatura.text =
        widget.mylago.maximosensorTemperatura.toString();
    controllerSuperLago.setTextSensorTemperatura =
        widget.mylago.sensorTemperatura;

    print(widget.mylago.registrosLagos[0].toMap());

    for (var i = 0; i < widget.mylago.registrosLagos.length; i++) {
      Lago fish = new Lago();

      fish.cantidadPeces = widget.mylago.registrosLagos[i].cantidadPeces;

      fish.fecha = widget.mylago.registrosLagos[i].fecha.toDate();

      fish.pez = new DetailFishModel.fromCreate(
          widget.mylago.registrosLagos[i].pez.nombrePez,
          widget.mylago.registrosLagos[i].pez.nombreCientifico,
          widget.mylago.registrosLagos[i].pez.nombreEspecie,
          widget.mylago.registrosLagos[i].pez.continente,
          widget.mylago.registrosLagos[i].pez.descripcion,
          widget.mylago.registrosLagos[i].pez.img,
          MiEstiloVida.fromCreate(
            widget.mylago.registrosLagos[i].pez.estiloVida.tempMin,
            widget.mylago.registrosLagos[i].pez.estiloVida.tempMax,
            widget.mylago.registrosLagos[i].pez.estiloVida.phMin,
            widget.mylago.registrosLagos[i].pez.estiloVida.phMax,
          ),
          MiDetallePez.fromCreate(
              widget.mylago.registrosLagos[i].pez.detalle.pesoMax,
              widget.mylago.registrosLagos[i].pez.detalle.edadMax),
          MisMediciones.fromCreate(
              widget.mylago.registrosLagos[i].pez.mediciones.tamanoMax,
              widget.mylago.registrosLagos[i].pez.mediciones.tamanoMin));

      controllerSuperLago.setListFishLake = fish;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: CustomBarActions(
          title: "Editar Lago",
          appBar: AppBar(),
          functionEdit: () =>  controller.editarLago(widget.mylago,formkey,controllerSuperLago),
          fuctionDelete: () => null,
          /*   function: () =>
              controller.agregarLago(context, formkey, sensorProvider), */
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formkey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Container(
                width: width,
                child: FormFieldLake(
                  labelText: "Nombre de Lago",
                  controller: controllerSuperLago.nombreDelLago,
                ),
              ),
              SizedBox(height: 20.0),
              ContainerPadding(
                  child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * 0.35,
                      child: FormFieldLake(
                        labelText: "Min Sensor Agua",
                        controller: controllerSuperLago.minSensorAgua,
                      ),
                    ),
                    Container(
                      width: width * 0.35,
                      child: FormFieldLake(
                        labelText: "Max Sensor Agua",
                        controller: controllerSuperLago.maxSensorAgua,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(children: [
                  Container(
                      width: width * 0.20, child: Text("Sensor de Agua: ")),
                  GetBuilder<ControllerSuperLago>(
                    init: controllerSuperLago,
                    builder: (_) => Expanded(
                        child: Container(
                            child: FutureBuilder<List<SensorAgua>>(
                                future: futures.getSensorAgua(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<SensorAgua>> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                        child: CircularProgressIndicator());
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
                                    textMostrado: _.textSensorAgua,
                                    functionChange: (value) {
                                      _.setTextSensorAgua = value;
                                    },
                                  );
                                }))),
                  )
                ]),
                SizedBox(height: 20.0),
                ContainerPadding(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.35,
                            child: FormFieldLake(
                              labelText: "Min Sensor Ph",
                              controller: controllerSuperLago.minSensorPh,
                            ),
                          ),
                          Container(
                            width: width * 0.35,
                            child: FormFieldLake(
                              labelText: "Max Sensor Ph",
                              controller: controllerSuperLago.maxSensorPh,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                              width: width * 0.20,
                              child: Text("Sensor de Ph: ")),
                          GetBuilder<ControllerSuperLago>(
                            init: controllerSuperLago,
                            builder: (_) => Expanded(
                              child: Container(
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
                                          textMostrado: _.textSensorPh,
                                          functionChange: (value) {
                                            _.setTextSensorPH = value;
                                          },
                                        );
                                      })),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      ContainerPadding(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width * 0.35,
                                  child: FormFieldLake(
                                    labelText: "Min Sensor Temperatura",
                                    controller: controllerSuperLago
                                        .minSensorTemperatura,
                                  ),
                                ),
                                Container(
                                  width: width * 0.35,
                                  child: FormFieldLake(
                                    labelText: "Max Sensor Temperatura",
                                    controller: controllerSuperLago
                                        .maxSensorTemperatura,
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
                                GetBuilder<ControllerSuperLago>(
                                    init: controllerSuperLago,
                                    builder: (_) => Expanded(
                                          child: Container(
                                              child: FutureBuilder<
                                                      List<SensorTemperatura>>(
                                                  future: futures
                                                      .getSensoresTemperatura(),
                                                  builder: (BuildContext
                                                          context,
                                                      AsyncSnapshot<
                                                              List<
                                                                  SensorTemperatura>>
                                                          snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }

                                                    List<SensorTemperatura>
                                                        data = snapshot.data;

                                                    if (data.length == 0) {
                                                      return ListTile(
                                                        title: Text(
                                                            'No hay resultados de sensores de Temperatura'),
                                                      );
                                                    }
                                                    print(
                                                        "sensor de temperatura");
                                                    return DynamicCustomDropwDownList(
                                                      snapshot: data,
                                                      textMostrado: _
                                                          .textSensorTemperatura,
                                                      functionChange: (value) {
                                                        _.setTextSensorTemperatura =
                                                            value;
                                                      },
                                                    );
                                                  })),
                                        )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                ContainerPadding(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.35,
                            child: FormFieldLake(
                              labelText: "Min Sensor Oxigeno",
                              controller: controllerSuperLago.minSensorOxigeno,
                            ),
                          ),
                          Container(
                            width: width * 0.35,
                            child: FormFieldLake(
                              labelText: "Max Sensor Oxigeno",
                              controller: controllerSuperLago.maxSensorOxigeno,
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
                          GetBuilder<ControllerSuperLago>(
                              init: controllerSuperLago,
                              builder: (_) => Expanded(
                                    child: Container(
                                        child:
                                            FutureBuilder<List<SensorOxigeno>>(
                                                future: futures
                                                    .getSensoresOxigeno(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<
                                                            List<SensorOxigeno>>
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
                                                        _.textSensorOxigeno,
                                                    functionChange: (value) {
                                                      _.setTextSensorOxigeno =
                                                          value;
                                                    },
                                                  );
                                                })),
                                  ))
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              SizedBox(height: 20.0),
              Container(
                height: 50.0,
                width: double.infinity,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text("Peces",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.43,
                    child: FutureBuilder(
                        future: futures.getCategoriaPeces(),
                        builder: (_, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }

                          List<FishListOrigin> list = snapshot.data;

                          return GetBuilder<ControllerSuperLago>(
                              init: controllerSuperLago,
                              builder: (_) => DynamicCustomDropwDownList(
                                  snapshot: list,
                                  textMostrado: _.textCategoria,
                                  functionChange: (value) {
                                    _.setCategoria = value;
                                  }));
                        }),
                  ),
                  ContainerBlue(
                    child: Container(
                      width: width * 0.43,
                      child: FormFieldLake(
                        labelText: "Cantidad Peces",
                        controller: controllerSuperLago.cantidadPeces,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                    width: width * 0.43,
                    child: GetBuilder<ControllerSuperLago>(
                        init: controllerSuperLago,
                        builder: (_) => FutureBuilder(
                              future: DatabaseService(null).getFishList(
                                  controllerSuperLago.textCategoria),
                              initialData: new List<DocumentSnapshot>(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<DocumentSnapshot>>
                                      snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.data.length == 0) {
                                    return Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
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
                                  }

                                  List<DetailFishModel> array = snapshot.data
                                      .map((doc) =>
                                          DetailFishModel.fromSnapshot(doc))
                                      .toList();

                                  return GetBuilder<ControllerSuperLago>(
                                      init: controllerSuperLago,
                                      builder: (_) =>
                                          DynamicCustomDropwDownList(
                                              snapshot: array,
                                              textMostrado: _.texto,
                                              functionChange: (value) {
                                                _.setNombrePez = value;
                                              }));
                                } else {
                                  return Center(
                                      child: SpinKitCircle(
                                    color: Colors.blue,
                                  ));
                                }
                              },
                            ))),
                ContainerBlue(
                  child: GetBuilder<ControllerSuperLago>(
                    init: controllerSuperLago,
                    builder: (_) => Container(
                      child: Row(
                        children: [
                          CustomRichText(
                            title: "Fecha",
                            componente:
                                "${controllerSuperLago.getDate}".split(' ')[0],
                          ),
                          IconButton(
                            onPressed: () async {
                              controllerSuperLago.setDate = await PickerDate()
                                  .pickDate(context,
                                      controllerSuperLago.getDate, "Fecha");
                            },
                            icon: Icon(Icons.calendar_today),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 5.0),
              CustomButton(
                function: () => controllerSuperLago.agregarPez(),
                customColor: Colors.blue,
                title: "Guardar Pez",
                scrWidth: width,
              ),
              SizedBox(height: 5.0),
              Container(
                height: 50.0,
                width: double.infinity,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text("Peces Registrados",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 5.0),
              GetBuilder<ControllerSuperLago>(
                  init: controllerSuperLago,
                  builder: (_) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: _.getListFish.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2.0,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                    child: Image.network(
                                        _.getListFish[index].pez.img,
                                        height: 50.0,
                                        width: 50.0)),
                                SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nombre del Pez:  " +
                                        _.getListFish[index].pez.nombrePez
                                            .toString()),
                                    Text("Fecha:  " +
                                        _.getListFish[index].fecha.toString()),
                                    Text("Cantidad de Peces:  " +
                                        _.getListFish[index].cantidadPeces
                                            .toString()),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    _.deletePez(index);
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      ))
            ]),
          ),
        )));
  }
}
