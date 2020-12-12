import 'package:drawer_menu/models/sensores/temperatura.dart';
import 'package:drawer_menu/pages/sensor/controller/controller_edit_sensor_oxigeno.dart';
import 'package:drawer_menu/pages/sensor/controller/controller_edit_sensor_temperatura.dart';
import 'package:drawer_menu/pages/sensor/provider/sensor_temperatura_provider.dart';
import 'package:drawer_menu/utils/getPhoto.dart';
import 'package:drawer_menu/widgets/appbar_actions.dart';
import 'package:drawer_menu/widgets/dropdow.dart';
import 'package:drawer_menu/widgets/textfiels/textfield.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditSensorTemperatura extends StatefulWidget {
  final SensorTemperatura item;

  EditSensorTemperatura({Key key, this.item}) : super(key: key);
  @override
  _EditSensorTemperaturaState createState() => _EditSensorTemperaturaState();
}

class _EditSensorTemperaturaState extends State<EditSensorTemperatura> {
  final _formKey = GlobalKey<FormState>();

  final _formKeyAgua = GlobalKey<FormState>();

  ControllerEditSensorTemperatura controller =
      new ControllerEditSensorTemperatura();

  SensorTemperaturaProvider provider;

  GetPhoto getPhoto = new GetPhoto();

  @override
  void initState() {
    provider = new SensorTemperaturaProvider(
        widget.item.referencia,
        widget.item.consumo,
        widget.item.temperatura,
        widget.item.precio,
        widget.item.resistenciaagua);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomBarActions(
        title: "Editar Sensor",
        appBar: AppBar(),
        functionEdit: () => controller.editSensorTemperatura(
            context, _formKeyAgua, provider, widget.item),
        fuctionDelete: () => controller.deleteSensorTemperatura(widget.item),

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
                          "Referencia")
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
                                controller: provider.textCONSUMOTemperatura,
                                label: "Consumo",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            width,
                            "Consumo"),
                        SizedBox(height: 20.0),
                        containerRow(
                            CustomInputField(
                                controller: provider.textPRECIOTemperatura,
                                label: "Precio",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            width,
                            "Precio"),
                        SizedBox(height: 20.0),
                        containerRow(
                            CustomInputField(
                                controller: provider.textTEMPERATURATOLERABLE,
                                label: "Temperatura Tolerable",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            width,
                            "Temperatura Tolerable"),
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
