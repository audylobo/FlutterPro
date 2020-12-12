import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/pages/sensor/provider/sensor_provider.dart';
import 'package:drawer_menu/utils/getPhoto.dart';
import 'package:drawer_menu/widgets/toast.dart';
import 'package:flutter/material.dart';

class ControllerCreateSensor {

  CustomToast toast = new CustomToast(); 

  GetPhoto getPhoto = new GetPhoto();

  void createSensorTemperatura(BuildContext context, GlobalKey<FormState> formkey,GlobalKey<FormState> _formKeyFORM, CreateProviderSensor provider) async {
    try {
      if(_formKeyFORM.currentState.validate( )&& formkey.currentState.validate() && provider.image!= null ){
       
        //validacion del form
        Firestore.instance.collection("sensor temperatura").document().setData({
          //se crea la tupla del SENSOR

          //MAP DE DOCUMENTO
         "resistencia_agua":  provider.resistenciaAgua,
         "referencia":        provider.textReferencia.text.trim(),
         "consumo":           provider.textCONSUMOTemperatura.text.trim(),
         "precio":            provider.textPRECIOTemperatura.text.trim(),
         "temperatura":       provider.textTEMPERATURATOLERABLE.text.trim(),
         "url_image":         await getPhoto.getUrlImage(provider.image)
        
        }).then((value) {
          toast.show("Sensor registrado", Colors.blue[900], Colors.white);
          provider.clearText();
          // Navigator.pushNamed(context, Routes.bibliotecarioHome); // navegacion a la pantalla de home.
        });
      
      }else {
        toast.show("Completa todos los datos", Colors.red, Colors.white);
      }
     
    } catch (event) {
      print(event.toString());
      toast.show(event.toString(), Colors.red, Colors.white);
    }
  }

  void createSensorOxigeno(BuildContext context, GlobalKey<FormState> formkey,
      CreateProviderSensor provider) async {
    try {
      if (formkey.currentState.validate()) {
        Firestore.instance.collection("sensor oxigeno").document().setData({
          "resistencia_agua":  provider.resistenciaAgua,
           "referencia":  provider.textReferencia.text.trim(),
          "voltaje": provider.textVOLTAJE.text.trim(),
          "precio": provider.textPrecioVoltaje.text.trim(),
          "deteccion": provider.textRangoDeteccionVoltaje.text.trim(),
          "precision": provider.textRangoPrecisionVoltaje.text.trim(),
         "url_image": await getPhoto.getUrlImage(provider.image)
        
        }).then((value) {
          toast.show("Sensor registrado", Colors.blue[900], Colors.white);
          provider.clearText();
        });
      } else {
        toast.show("Completa todos los datos", Colors.red, Colors.white);
      }
    } catch (event) {
      print(event.toString());
      toast.show(event.toString(), Colors.red, Colors.white);
    }
  }

  void createSensorPH(BuildContext context, GlobalKey<FormState> formkey,
      CreateProviderSensor provider) async {
    try {
      if (formkey.currentState.validate()) {
        Firestore.instance.collection("sensor ph").document().setData({
          "resistencia_agua":  provider.resistenciaAgua,
           "referencia":  provider.textReferencia.text.trim(),
          "voltaje": provider.textVOLTAJEPH.text.trim(),
          "medicion": provider.textMEDICIONPH.text.trim(),
          "temperatura_tolerable":
              provider.textTemperaturaTolerablePH.text.trim(),
          "precision": provider.textPrecisionPH.text.trim(),
          "tiempo_respuesta": provider.textTiempoRespuestaPH.text.trim(),
          "url_image": await getPhoto.getUrlImage(provider.image)
        
        }).then((value) {
          toast.show("Sensor registrado", Colors.blue[900], Colors.white);
          provider.clearText();
        });
      } else {
        toast.show("Completa todos los datos", Colors.red, Colors.white);
      }
    } catch (event) {
      print(event.toString());
      toast.show(event.toString(), Colors.red, Colors.white);
    }
  }

  void createSensorNivelAgua(BuildContext context, GlobalKey<FormState> formkey,
      CreateProviderSensor provider) async {
    try {
      if (formkey.currentState.validate()) {
        Firestore.instance.collection("sensor agua").document().setData({
          "resistencia_agua":  provider.resistenciaAgua,
          "referencia":  provider.textReferencia.text.trim(),
          "voltaje": provider.textVOLTAJEAgua.text.trim(),
          "precio": provider.textPrecioAgua.text.trim(),
          "distancia": provider.textDistanciaAgua.text.trim(),
          "frecuencia": provider.textFrecuenciaAgua.text.trim(),
          "corriente": provider.textCorrienteAgua.text.trim(),
          "url_image": await getPhoto.getUrlImage(provider.image)
        
        }).then((value) {
          toast.show("Sensor registrado", Colors.blue[900], Colors.white);
          provider.clearText();
        });
      } else {
        toast.show("Completa todos los datos", Colors.red, Colors.white);
      }
    } catch (event) {
      print(event.toString());
      toast.show(event.toString(), Colors.red, Colors.white);
    }
  }
}
