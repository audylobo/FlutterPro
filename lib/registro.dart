import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:drawer_menu/flutter_hide_show_password_input.dart';
import 'package:drawer_menu/font_awesome_flutter.dart';
class Registro extends StatefulWidget {
  static const String routeName = "/registro";
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool _showPassword = false;
  final scaffolkey = new GlobalKey<ScaffoldState>();
  final formkey = new GlobalKey <FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffolkey,
    appBar: new AppBar(
      title: new Text(widget.toString()),
    ), 
    
     
    body: Padding(
      
      padding: const EdgeInsets.all(20.0),
      
      child: Form( 
        
        key: formkey,
    child:ListView(children: <Widget>[
 Padding(
   padding: const EdgeInsets.only(top:20.0),

   child:TextFormField(
       validator: (value){
         if(value.isEmpty){
          return 'Por favor ingrese tu nombre';
         }
         if(RegExp(r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$').hasMatch(value)){
           return "caracteres invalidos";
         }
          return null;
       },
     
     decoration: InputDecoration(
       prefixIcon: Icon(Icons.account_circle, color: Colors.green),
       labelText:'Nombre',
       hintText: 'Escribe tu nombre',
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(5.0),
       ),
     ),
   ),
     
 ),
    
     Padding(
   padding: const EdgeInsets.only(top:20.0),

   child:TextFormField(
     validator: (value){
         if(value.isEmpty){
          return 'Por favor ingrese tu Apellido';
         }
         if(RegExp(r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$').hasMatch(value)){
           return "caracteres invalidos";
         }
          return null;
       },
     decoration: InputDecoration(
       prefixIcon: Icon(Icons.font_download, color: Colors.green),
       labelText:'Apellido',
       hintText: 'Escribe tu Apellido ',
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(5.0),
       ),
     ),
   ),
     
 ),
     Padding(
   padding: const EdgeInsets.only(top:20.0),

   child:TextFormField(
    validator: (value){
         if(value.isEmpty){
          return 'Por favor ingresa tu correo electronico';
         }
         if(!RegExp(r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$").hasMatch(value)) {
             return "correo invalido";
         }


          return null;
       },
     decoration: InputDecoration(
       prefixIcon: Icon(Icons.email, color: Colors.green),
       labelText:'Correo',
       hintText: 'Escribe tu correo',
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(5.0),
       ),
     ),
   ),
     
 ),
     Padding(
   padding: const EdgeInsets.only(top:20.0),

   child:TextFormField(
     
     obscureText: !_showPassword,
    validator: (value){
         if(value.isEmpty){
          return 'Este campo no puede esta vacio';
         }
          return null;
       },
     decoration: InputDecoration(
       prefixIcon: Icon(Icons.accessibility, color: Colors.green),
       labelText:'Nueva Contraseña',
       hintText: 'Escribe tu nueva contraseña',
      suffixIcon: GestureDetector( 
       onTap: (){
         setState(() {
           _showPassword = !_showPassword;

         });

       },
       child: Icon(
         _showPassword ? Icons.visibility : Icons.visibility_off,
       ),
      ),
      
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(5.0),
       ),
     ),
     
   ),
     
 ),
            Padding(
   padding: const EdgeInsets.only(top:20.0),

   child:TextFormField(
     
     obscureText: !_showPassword,
    validator: (value){
         if(value.isEmpty){
          return 'Este campo no puede esta vacio';
         }
          return null;
       },
     decoration: InputDecoration(
       prefixIcon: Icon(Icons.accessibility_new, color: Colors.green),
       labelText:'Ingrese Nuevamente Contraseña',
       hintText: 'Escribe Nuevamente contraseña',
       
    
      
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(5.0),
       ),
     ),
     
   ),
     
 ),
     Padding(
   padding: const EdgeInsets.only(top:20.0),

   child:TextFormField(
     
   validator: (value) {
         if(value.isEmpty){
          return 'el campo esta vacio';
         }
         if(RegExp(r'^[a-zA-Z]+$').hasMatch(value)){
           return "caracteres invalidos";
         }
         if(value.length<=10)
         return "Escribe Nuevamente telefono";
          return null;
   
       },
     decoration: InputDecoration(
       prefixIcon: Icon(Icons.phone_iphone, color: Colors.green),
       labelText:'telefono',
       hintText: 'Escribe tu Numero',
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(5.0),
       ),
     ),
   ),
     
 ),
 SizedBox(height:20.0,),
 RaisedButton(
   child: Text("ENVIAR DATOS"),
   color: Colors.green,
   textColor: Colors.white,
   onPressed:(){
     if(formkey.currentState.validate()){ 
     }
   }
 )
    
    ]),
    ),
    ),
    );
  }

}