import 'package:flutter/material.dart';
class Lago1 extends StatelessWidget {
  static const String routeName = "/lagoA";


  @override
 Widget build(BuildContext context) {
    return new MaterialApp(home: new MyCard1());
  }
}

class MyCard1 extends StatelessWidget {
  List cards = new List.generate(10, (i) => new CustomCard()).toList();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Cards en Flutter'),
        backgroundColor: new Color(0xFF673AB7),
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
          // Agregamos una imagen consumida desde internet
          new Image.network('https://static8.depositphotos.com/1526816/996/v/450/depositphotos_9960341-stock-illustration-lake-house.jpg'),
          // Agregamos un contenedor para el texto
          new Container(
            padding: const EdgeInsets.all(10.0), // Un padding para todo
            child: Text(
              '''Tu lago de pesca''',
              softWrap: true,
            ),
          ),
          new Padding(
            // Esta seccion sera para los botones de acciones
            padding: new EdgeInsets.all(7.0), // Un padding general entre cada elemento
            child: new Row(
              // mainAxisAlignment permite alinear el contenido dentro de Row
              // en este caso le digo que use spaceBetwee, esto hara que
              // cualquier espacio horizontal que no se haya asignado dentro de children
              // se divida de manera uniforme y se coloca entre los elementos secundarios.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
            )
          )
        ],
      ),
    );
  }
}