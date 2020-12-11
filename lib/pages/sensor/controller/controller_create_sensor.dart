import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/widgets/toast.dart';
import 'package:flutter/material.dart';

class ControllerCreateSensor {
  CustomToast toast = new CustomToast(); //mensajes
  

  void createSensor(BuildContext context, GlobalKey<FormState> formkey) async {
  
    try {
      if (formkey.currentState.validate()) { //validacion del form
        Firestore.instance.collection("snsor").document().setData({ //se crea la tupla del libro
      //MAP
         }).then((value) {
        
          toast.show("Sensor registrado", Colors.blue[900], Colors.white);
        
          //Navigator.pushNamed(context, Routes.bibliotecarioHome);
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
