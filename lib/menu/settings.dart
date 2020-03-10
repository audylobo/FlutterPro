import 'package:flutter/material.dart';

class Settings extends StatelessWidget{
  static const String routeName = "/configuracion";
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Configuracion"),
         backgroundColor: Colors.blueGrey[100], 
        ),
        body: new Container(
          child: new Center(
            child: new Text("Pantalla de configuracion")
          )
        ),
        
    );
  }
}