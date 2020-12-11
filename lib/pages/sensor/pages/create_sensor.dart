import 'package:drawer_menu/pages/sensor/controller/controller_create_sensor.dart';
import 'package:drawer_menu/widgets/appbar.dart';
import 'package:drawer_menu/widgets/dropdow.dart';
import 'package:drawer_menu/widgets/textfiels/textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CreateSensor extends StatelessWidget {
  CreateControllerSensor controller = new CreateControllerSensor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(
        title: "Crear Sensor",
        appBar: AppBar(),
        function: null,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
              SizedBox(height: 20.0),
              CustomInputField(
                  controller: controller.textNombre,
                  label: "Nombre",
                  inputType: TextInputType.text,
                  icono: Icons.person_add),
            ],
          ),
        ),
      ),
    );
  }
}
