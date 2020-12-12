import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/sensores/temperatura.dart';
import 'package:drawer_menu/pages/sensor/provider/sensor_temperatura_provider.dart';
import 'package:flutter/material.dart' show BuildContext, GlobalKey, FormState, Colors;
import 'package:drawer_menu/utils/getPhoto.dart';
import 'package:drawer_menu/widgets/toast.dart';

class ControllerEditSensorTemperatura {
  CustomToast toast = new CustomToast();

  GetPhoto getPhoto = new GetPhoto();

  void editSensorTemperatura(BuildContext context, GlobalKey<FormState> formkey,
      SensorTemperaturaProvider provider, SensorTemperatura item) async {
    try {
      if (formkey.currentState.validate()) {
        Firestore.instance
            .collection("sensor temperatura")
            .document(item.idSensorTemperatura)
            .updateData({
          if (provider.image != null) ...{
            "url_image": await getPhoto.getUrlImage(provider.image)
          },
          "resistencia_agua": provider.resistenciaAgua,
          "referencia": provider.textReferencia.text.trim(),
          "consumo": provider.textCONSUMOTemperatura.text.trim(),
          "precio": provider.textPRECIOTemperatura.text.trim(),
          "temperatura": provider.textTEMPERATURATOLERABLE.text.trim(),
        }).then((value) {
          toast.show(
              "Sensor de Temperatura editado", Colors.blue[900], Colors.white);
        });
      } else {
        toast.show("Completa todos los datos", Colors.red, Colors.white);
      }
    } catch (event) {
      toast.show(event.toString(), Colors.red, Colors.white);
    }
  }

  void deleteSensorTemperatura(SensorTemperatura item) {
    try {
      Firestore.instance
          .collection("sensor temperatura")
          .document(item.idSensorTemperatura)
          .delete()
          .then((value) {
        toast.show(
            "Sensor de Temperatura eliminado", Colors.blue[900], Colors.white);
      });
    } catch (event) {
      toast.show(event.toString(), Colors.red, Colors.white);
    }
  }
}
