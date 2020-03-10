import 'package:flutter/material.dart';
import 'package:drawer_menu/menu/sensor.dart';
import 'package:drawer_menu/font_awesome_flutter.dart';
class SensorA extends StatelessWidget {
  static const String routeName = "/sensorA";
  

  @override
   Widget build(BuildContext context) {
       
    return new MaterialApp(home: new MyCard1());
     
    
  }
}

class MyCard1 extends StatelessWidget {
  List cards = new List.generate(1, (i) => new CustomCard()).toList();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sensor de Temperatura'),
        backgroundColor: new Color(0xFF673AB7),
         actions: <Widget>[
          Container(margin: EdgeInsets.only(right:25),
          child: Icon(Icons.favorite_border),
          )
        ]
      ),
      body: new Container(
        
        child: new ListView(
          children: cards,
        )
      )
    );
  }
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      
      // Los hijos dentro de card en columnas, debajo de otro
      child: new Column(
        

        children: <Widget>[
        new Container(
          // Agregamos una imagen consumida desde internet
                     child: new Image.network('http://k-electronica.es/421-large_default/sensor-de-temperatura-digital-resistente-al-agua-o-sensor-ds18b20-tu-tienda-arduino-en-tenerife-canarias-la-laguna.jpg',   width: 400.0,
      height: 250.0, alignment:Alignment.topLeft  ),
        ),
new Container(
 alignment: Alignment.topRight,
  child: Icon(FontAwesomeIcons.placeOfWorship, ),
),
          // Agregamos un contenedor para el texto
          new Container(
 

          
            padding: const EdgeInsets.all(10.0), // Un padding para todo
            child: Text(
              
              '''Cuenta con tres terminales: Vcc, GND y el pin Data. Este sensor utiliza comunicación por  protocolo serial digital OneWire. Esté protocolo de comunicación permite enviar y recibir datos utilizando un solo cable. A diferencia de otros, que utilizan dos o más líneas de comunicación digital. ''',
              style: TextStyle(
              height:1.0 , fontSize:20,
              ),
              softWrap: true,
            ),
          ),
        
        ],
      ),
    );
  }
}