import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/sensores/agua.dart';
import 'package:drawer_menu/pages/sensor/provider/sensor_agua_provider.dart';
import 'package:flutter/material.dart'
    show BuildContext, GlobalKey, FormState, Colors;
import 'package:drawer_menu/utils/getPhoto.dart';
import 'package:drawer_menu/widgets/toast.dart';

class ControllerEditSensorAgua {
  CustomToast toast = new CustomToast();

  GetPhoto getPhoto = new GetPhoto();

  void editSensorAgua(BuildContext context, GlobalKey<FormState> formkey,
      SensorProviderAgua provider, SensorAgua item) async {
    try {
      if (formkey.currentState.validate()) {
        Firestore.instance
            .collection("sensor agua")
            .document(item.idSensorAgua)
            .updateData({
          if (provider.image != null) ...{
            "url_image": await getPhoto.getUrlImage(provider.image)
          },
          "corriente": provider.textCorrienteAgua.text.trim(),
          "distancia": provider.textDistanciaAgua.text.trim(),
          "frecuencia": provider.textFrecuenciaAgua.text.trim(),
          "precio": provider.textPrecioAgua.text.trim(),
          "referencia": provider.textReferencia.text.trim(),
          "resistencia_agua": provider.resistenciaAgua,
          "voltaje": provider.textVOLTAJEAgua.text.trim(),
        }).then((value) {
          toast.show("Sensor de agua editado", Colors.blue[900], Colors.white);
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

  void deleteSensorAgua(SensorAgua item) {
    try {
      Firestore.instance
          .collection("sensor agua")
          .document(item.idSensorAgua)
          .delete()
          .then((value) {
        toast.show("Sensor de agua eliminado", Colors.blue[900], Colors.white);
        //provider.resetData();
        // Navigator.pushNamed(context, Routes.bibliotecarioHome);
      });
    } catch (event) {
      toast.show(event.toString(), Colors.red, Colors.white);
    }
  }
}
