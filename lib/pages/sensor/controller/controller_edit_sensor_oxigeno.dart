import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:drawer_menu/models/sensores/oxigeno.dart';
import 'package:drawer_menu/pages/sensor/provider/sensor_oxigeno_provider.dart';
import 'package:flutter/material.dart'
    show BuildContext, GlobalKey, FormState, Colors;
import 'package:drawer_menu/utils/getPhoto.dart';
import 'package:drawer_menu/widgets/toast.dart';

class ControllerEditSensorOxigeno {
  CustomToast toast = new CustomToast();

  GetPhoto getPhoto = new GetPhoto();

  void editSensorOxigeno(BuildContext context, GlobalKey<FormState> formkey,
      SensorOxigenoProvider provider, SensorOxigeno item) async {
    try {
      if (formkey.currentState.validate()) {
        Firestore.instance
            .collection("sensor oxigeno")
            .document(item.idSensorOxigeno)
            .updateData({
          if (provider.image != null) ...{
            "url_image": await getPhoto.getUrlImage(provider.image)
          },
          "resistencia_agua": provider.resistenciaAgua,
          "referencia": provider.textReferencia.text.trim(),
          "voltaje": provider.textVOLTAJE.text.trim(),
          "precio": provider.textPrecioVoltaje.text.trim(),
          "deteccion": provider.textRangoDeteccionVoltaje.text.trim(),
          "precision": provider.textRangoPrecisionVoltaje.text.trim(),
          
        }).then((value) {
          toast.show(
              "Sensor de oxigeno editado", Colors.blue[900], Colors.white);
          //provider.resetData();
          // Navigator.pushNamed(context, Routes.bibliotecarioHome);
        });
      } else {
        toast.show("Completa todos los datos", Colors.red, Colors.white);
      }
    } catch (event) {
      toast.show(event.toString(), Colors.red, Colors.white);
    }
  }

  void deleteSensorOxigeno(SensorOxigeno item) {
    try {
      Firestore.instance
          .collection("sensor oxigeno")
          .document(item.idSensorOxigeno)
          .delete()
          .then((value) {
        toast.show(
            "Sensor de oxigeno eliminado", Colors.blue[900], Colors.white);
        //provider.resetData();
        // Navigator.pushNamed(context, Routes.bibliotecarioHome);
      });
    } catch (event) {
      toast.show(event.toString(), Colors.red, Colors.white);
    }
  }
}
