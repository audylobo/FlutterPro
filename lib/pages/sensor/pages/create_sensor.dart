import 'package:drawer_menu/pages/sensor/controller/controller_create_sensor.dart';
import 'package:drawer_menu/pages/sensor/provider/sensor_provider.dart';
import 'package:drawer_menu/widgets/appbar.dart';
import 'package:drawer_menu/widgets/bottombar.dart';
import 'package:drawer_menu/widgets/dropdow.dart';
import 'package:drawer_menu/widgets/textfiels/textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CreateSensor extends StatelessWidget {
  CreateProviderSensor controller = new CreateProviderSensor();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        color: Colors.blue,
        texto: "Guardar registro",
        width: double.infinity,
        function: null,
        // function: () => _controller.createLibro(context, _formKey, provider),
      ),
      appBar: CustomBar(
        title: "Crear Sensor",
        appBar: AppBar(),
        function: null,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 50.0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 20.0),
                  CustomInputField(
                      controller: controller.textNombre,
                      label: "Nombre",
                      inputType: TextInputType.text,
                      icono: Icons.person_add),
                  SizedBox(height: 20.0),
                  CustomInputField(
                      controller: controller.textVoltaje,
                      label: "Voltaje",
                      inputType: TextInputType.text,
                      icono: Icons.volume_mute),
                  SizedBox(height: 20.0),
                  CustomInputField(
                      controller: controller.textDescripcion,
                      label: "Descripción",
                      inputType: TextInputType.text,
                      icono: Icons.dehaze),
                  SizedBox(height: 20.0),
                  CustomInputField(
                      controller: controller.textReferencia,
                      label: "Referencia",
                      inputType: TextInputType.text,
                      icono: Icons.receipt),
                  SizedBox(height: 20.0),
                  CustomDropwDownList(
                    validator: "Tipo de Sensor (?)",
                    data: [
                      "Sensor de Temperatura",
                      "Sensor de Oxígeno",
                      "Sensor de PH",
                      "Sensor de Nivel de Agua"
                    ],
                    provider: controller.tipoSensor,
                    functionChange: (value) {
                      controller.setTipoSensor = value;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
