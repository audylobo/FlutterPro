import 'package:drawer_menu/pages/sensor/controller/controller_create_sensor.dart';
import 'package:drawer_menu/pages/sensor/provider/sensor_provider.dart';
import 'package:drawer_menu/utils/getPhoto.dart';
import 'package:drawer_menu/widgets/appbar.dart';

import 'package:drawer_menu/widgets/button.dart';
import 'package:drawer_menu/widgets/dropdow.dart';
import 'package:drawer_menu/widgets/textfiels/textfield.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CreateSensor extends StatefulWidget {
  @override
  _CreateSensorState createState() => _CreateSensorState();
}

class _CreateSensorState extends State<CreateSensor> {
  ControllerCreateSensor controller = new ControllerCreateSensor();

  final _formKeyTemperatura = GlobalKey<FormState>();
  final _formKeyOxigeno = GlobalKey<FormState>();
  final _formKeyPH = GlobalKey<FormState>();
  final _formKeyAgua = GlobalKey<FormState>();

  GetPhoto getPhoto = new GetPhoto();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateProviderSensor>(context);
    return Scaffold(
      appBar: CustomBar(
        title: "Crear Sensor",
        appBar: AppBar(),
        function: null,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    var image = await getPhoto.showChoiceDialog(context);
                    if (image != null) {
                      provider.setImage = image;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    height: 150,
                    width: 150,
                    child: provider.image == null
                        ? Icon(Icons.camera, color: Colors.white, size: 40)
                        : Image.file(
                            provider.image,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(height: 20.0),
                CustomDropwDownList(
                  validator: "Tipo de Sensor (?)",
                  data: [
                    "Sensor de Temperatura",
                    "Sensor de Oxígeno",
                    "Sensor de PH",
                    "Sensor de Nivel de Agua"
                  ],
                  provider: provider.tipoSensor,
                  functionChange: (value) {
                    provider.setTipoSensor = value;
                  },
                ),
                SizedBox(height: 20.0),
                if (provider.tipoSensor == "Sensor de Temperatura") ...{
                  Container(
                    color: Colors.grey[200],
                    width: provider.widthTemperatura,
                    child: Form(
                      key: _formKeyTemperatura,
                      child: Column(
                        children: [
                          CustomInputField(
                              controller: provider.textCONSUMOTemperatura,
                              label: "Consumo",
                              inputType: TextInputType.text,
                              icono: Icons.receipt),
                          SizedBox(height: 20.0),
                          CustomInputField(
                              controller: provider.textPRECIOTemperatura,
                              label: "Precio",
                              inputType: TextInputType.text,
                              icono: Icons.receipt),
                          SizedBox(height: 20.0),
                          CustomInputField(
                              controller: provider.textTEMPERATURATOLERABLE,
                              label: "Temperatura Tolerable",
                              inputType: TextInputType.text,
                              icono: Icons.receipt),
                          SizedBox(height: 20.0),
                          CustomButton(
                            function: () => controller.createSensorTemperatura(
                                context, _formKeyTemperatura, provider),
                            customColor: Color(0xFF242424),
                            title: "Guardar Sensor",
                            scrWidth: double.infinity * 0.90,
                          ),
                        ],
                      ),
                    ),
                  )
                },
                if (provider.tipoSensor == "Sensor de Oxígeno") ...{
                  Container(
                    color: Colors.grey[200],
                    child: Form(
                      key: _formKeyOxigeno,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            CustomInputField(
                                controller: provider.textVOLTAJE,
                                label: "Voltaje",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomInputField(
                                controller: provider.textPrecioVoltaje,
                                label: "Precio de Voltaje",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomInputField(
                                controller: provider.textRangoDeteccionVoltaje,
                                label: "Rango de detección",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomInputField(
                                controller: provider.textRangoPrecisionVoltaje,
                                label: "Rango de precisión",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomButton(
                              function: () => controller.createSensorOxigeno(
                                  context, _formKeyOxigeno, provider),
                              customColor: Color(0xFF242424),
                              title: "Guardar Sensor",
                              scrWidth: double.infinity * 0.90,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                },
                if (provider.tipoSensor == "Sensor de PH") ...{
                  Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formKeyPH,
                        child: Column(
                          children: [
                            CustomInputField(
                                controller: provider.textVOLTAJEPH,
                                label: "Voltaje",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomInputField(
                                controller: provider.textMEDICIONPH,
                                label: "Medicion",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomInputField(
                                controller: provider.textTemperaturaTolerablePH,
                                label: "Temperatura Tolerable",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomInputField(
                                controller: provider.textPrecisionPH,
                                label: "Precision de PH",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomInputField(
                                controller: provider.textTiempoRespuestaPH,
                                label: "Tiempo de respuesta",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomButton(
                              function: () => controller.createSensorPH(
                                  context, _formKeyPH, provider),
                              customColor: Color(0xFF242424),
                              title: "Guardar Sensor",
                              scrWidth: double.infinity * 0.90,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                },
                if (provider.tipoSensor == "Sensor de Nivel de Agua") ...{
                  Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formKeyAgua,
                        child: Column(
                          children: [
                            CustomInputField(
                                controller: provider.textVOLTAJEAgua,
                                label: "Voltaje",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomInputField(
                                controller: provider.textPrecioAgua,
                                label: "Precio",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomInputField(
                                controller: provider.textDistanciaAgua,
                                label: "Distancia",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomInputField(
                                controller: provider.textFrecuenciaAgua,
                                label: "Frecuencia",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomInputField(
                                controller: provider.textCorrienteAgua,
                                label: "Corriente",
                                inputType: TextInputType.text,
                                icono: Icons.receipt),
                            SizedBox(height: 20.0),
                            CustomButton(
                              function: () => controller.createSensorNivelAgua(
                                  context, _formKeyAgua, provider),
                              customColor: Color(0xFF242424),
                              title: "Guardar Sensor",
                              scrWidth: double.infinity * 0.90,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
