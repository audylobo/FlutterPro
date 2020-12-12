import 'package:drawer_menu/models/sensores/ph.dart';
import 'package:drawer_menu/pages/sensor/controller/controller_edit_sensor_ph.dart';
import 'package:drawer_menu/pages/sensor/provider/sensor_ph_provider.dart';
import 'package:drawer_menu/utils/getPhoto.dart';
import 'package:drawer_menu/widgets/appbar_actions.dart';
import 'package:drawer_menu/widgets/dropdow.dart';
import 'package:drawer_menu/widgets/textfiels/textfield.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditSensorPH extends StatefulWidget {
  final SensorPH item;

  EditSensorPH({this.item});
  @override
  _EditSensorPHState createState() => _EditSensorPHState();
}

class _EditSensorPHState extends State<EditSensorPH> {
  final _formKey = GlobalKey<FormState>();

  final _formKeyAgua = GlobalKey<FormState>();

  ControllerEditSensorPH controller = new ControllerEditSensorPH();

  SensorPHProvider provider;

  GetPhoto getPhoto = new GetPhoto();

  @override
  void initState() {
      print(widget.item.urlimage);
      provider = new SensorPHProvider(
        widget.item.referencia,    
        widget.item.voltaje,
        widget.item.medicion,
        widget.item.temperaturaTolerable,
        widget.item.precision,
        widget.item.tiempoRespuesta,
        widget.item.resistenciaAgua,

        
      ); 

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomBarActions(
        title: "Editar Sensor",
        appBar: AppBar(),
        fuctionDelete: () => controller.deleteSensorPH(widget.item),
        functionEdit: () => controller.editSensorPH(
            context, _formKeyAgua, provider, widget.item),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var image = await getPhoto.showChoiceDialog(context);
                          if (image != null) {
                            provider.setImage = image;
                          }

                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          height: 150,
                          width: 150,
                          child: provider.image == null
                              ? Image.network(
                                  widget.item.urlimage,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  provider.image,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(height: 20.0),
                      Row(children: [
                        Container(
                            width: width * 0.20,
                            child: Text("Resistente al Agua: ")),
                        Expanded(
                          child: CustomDropwDownList(
                            validator: "Resistente al Agua (?)",
                            data: [
                              "Sí",
                              "No",
                            ],
                            provider: provider.resistenciaAgua,
                            functionChange: (value) {
                              provider.setResistencia = value;
                            },
                          ),
                        )
                      ]),
                       SizedBox(height: 20.0),
                      containerRow(
                          CustomInputField(
                              controller: provider.textReferencia,
                              label: "Referencia",
                              inputType: TextInputType.text,
                              icono: Icons.receipt),
                          width,
                          "Referencia"),

                      SizedBox(height: 20.0),
                      containerRow(
                          CustomInputField(
                              controller: provider.textVOLTAJEPH,
                              label: "Voltaje",
                              inputType: TextInputType.text,
                              icono: Icons.receipt),
                          width,
                          "Voltaje"),

                     
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  color: Colors.grey[200],
                  child: Form(
                    key: _formKeyAgua,
                    child: Column(
                      children: [
                        containerRow(
                            CustomInputField(
                                controller: provider.textMEDICIONPH,
                                label: "Medicion",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            width,
                            "Medicion"),
                        SizedBox(height: 20.0),
                        containerRow(
                            CustomInputField(
                                controller: provider.textTemperaturaTolerablePH,
                                label: "Temperatura Tolerable",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            width,
                            "Temperatura Tolerable"),
                        SizedBox(height: 20.0),
                        containerRow(
                            CustomInputField(
                                controller: provider.textPrecisionPH,
                                label: "Precision de PH",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            width,
                            "Precision de PH"),
                        SizedBox(height: 20.0),
                        containerRow(
                            CustomInputField(
                                controller: provider.textTiempoRespuestaPH,
                                label: "Tiempo de respuesta",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            width,
                            "Tiempo de respuesta"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget containerRow(Widget child, double width, String text) {
    return Row(children: [
      Container(width: width * 0.20, child: Text("$text")),
      Expanded(
        child: child,
      ),
    ]);
  }
}
