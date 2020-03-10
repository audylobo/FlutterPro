import 'package:flutter/material.dart';
import 'package:drawer_menu/font_awesome_flutter.dart';
class Lagos extends StatelessWidget{
  static const String routeName = "/lagos";
  @override
  Widget build(BuildContext context){
     final double iconSize = 40.0;
    final TextStyle textStyle= new TextStyle(
      color: Colors.lightGreen, fontSize: 30.0
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("estanques"),
         backgroundColor: Colors.blueGrey[100], 
        ),
         body: new Container(
        child: Center(
child: new Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
    new MyCard(title: new Text("Estanque 1", style: textStyle),
    temp: new Text("Temperatura"),
    ph: new Text("Nivel de ph"),
    oxi: new Text("Nivel de Oxigeno"),
    nivel: new Text("Nivel del agua"),
    icon: new Icon(FontAwesomeIcons.water, size:iconSize, color: Colors.lightBlue,)) ,
     new MyCard(title: new Text("Estanque 2", style: textStyle),
      temp: new Text("Temperatura"),
    ph: new Text("Nivel de ph"),
    oxi: new Text("Nivel de Oxigeno"),
    nivel: new Text("Nivel del agua"),
    icon: new Icon(FontAwesomeIcons.water, size:iconSize, color: Colors.redAccent,)),
     new MyCard(title: new Text("Estanque 3", style: textStyle),
      temp: new Text("Temperatura"),
    ph: new Text("Nivel de ph"),
    oxi: new Text("Nivel de Oxigeno"),
    nivel: new Text("Nivel del agua"),
    icon: new Icon(FontAwesomeIcons.water, size:iconSize, color: Colors.blueAccent,))
  ],
),
),
      ),
    );
  }
}

class MyCard extends StatelessWidget{
  final Widget title;
  final Widget icon;
  final Widget temp;
  final Widget oxi;
  final Widget ph;
  final Widget nivel;
  
  MyCard({this.title, this.icon, this.temp, this.oxi, this.ph, this.nivel});
  
  @override
Widget build(BuildContext context){

    return new Container(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: new Card(
        child: new Container(
    padding: const EdgeInsets.all(5.0),
  child: Column(
    children: <Widget>[this.title, this.icon, this.temp, this.oxi, this.ph, this.nivel],
  ),
  )
  )
    );
  }
}  

