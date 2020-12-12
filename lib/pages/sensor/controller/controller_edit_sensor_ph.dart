



import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:drawer_menu/models/sensores/ph.dart';
import 'package:drawer_menu/pages/sensor/provider/sensor_ph_provider.dart';
import 'package:flutter/material.dart' show BuildContext, GlobalKey, FormState, Colors;
import 'package:drawer_menu/utils/getPhoto.dart';
import 'package:drawer_menu/widgets/toast.dart';

class ControllerEditSensorPH {
  CustomToast toast = new CustomToast();

  GetPhoto getPhoto = new GetPhoto();

  void editSensorPH(BuildContext context, GlobalKey<FormState> formkey, SensorPHProvider provider, SensorPH item) async {

    try {

      if (formkey.currentState.validate()) {

        Firestore.instance
            .collection("sensor ph")
            .document(item.idSensorPH)
            .updateData({
          if (provider.image != null) ...{
            "url_image": await getPhoto.getUrlImage(provider.image)
          },
             "resistencia_agua":  provider.resistenciaAgua,
           "referencia":  provider.textReferencia.text.trim(),
          "voltaje": provider.textVOLTAJEPH.text.trim(),
          "medicion": provider.textMEDICIONPH.text.trim(),
          "temperatura_tolerable":
              provider.textTemperaturaTolerablePH.text.trim(),
          "precision": provider.textPrecisionPH.text.trim(),
          "tiempo_respuesta": provider.textTiempoRespuestaPH.text.trim(),
          
        }).then((value) {
          toast.show(
              "Sensor de ph editado", Colors.blue[900], Colors.white);
         
        });
      } else {
        toast.show("Completa todos los datos", Colors.red, Colors.white);
      }
    } catch (event) {
      toast.show(event.toString(), Colors.red, Colors.white);
    }
  }

  void deleteSensorPH(SensorPH item) {
    try {
      Firestore.instance
          .collection("sensor ph")
          .document(item.idSensorPH)
          .delete()
          .then((value) {
        toast.show(
            "Sensor de ph eliminado", Colors.blue[900], Colors.white);
      
      });
    } catch (event) {
      toast.show(event.toString(), Colors.red, Colors.white);
    }
  }
}
