import 'package:flutter/material.dart';

class Help extends StatelessWidget{
  static const String routeName = "/ayuda";
  @override
  Widget build(BuildContext context){
      final double iconSize = 25.0;
    final TextStyle textStyle= new TextStyle(
      color: Colors.black87, fontSize: 25.0, 
    );
    final TextAlign textAlignb = TextAlign.left;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ayuda"),
         backgroundColor: Colors.blueGrey[100], 
        ),
         body: new Container(
        child: Center(
child: new Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
    new MyCard(title: new Text("Sensor de ph", style: textStyle, textAlign: TextAlign.justify, ),
    v:  Text("nivel de ph", style: textStyle , textAlign: textAlignb,),
    icon: new Icon(Icons.speaker_phone, size:iconSize, color: Colors.lightBlue,)) ,

     new MyCard(title: new Text("Sensor de oxigeno", style: textStyle),
      v: new Text("nivel de oxigeno ",  style: textStyle),
   icon: new Icon(Icons.speaker_phone, size:iconSize, color: Colors.redAccent,)),

     new MyCard(title: new Text("Sensor de volumen", style: textStyle),
      v: new Text("nivel de agua",  style: textStyle),
    icon: new Icon(Icons.speaker_phone, size:iconSize, color: Colors.yellow,)) ,
     new MyCard(title: new Text("Sensor de Temperatura", style: textStyle),
      v: new Text("Temperatura", style: textStyle),
    icon: new Icon(Icons.speaker_phone, size:iconSize, color: Colors.green,))

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
  final Widget v;

  
  MyCard({this.title, this.v, this.icon});
  
  @override
Widget build(BuildContext context){

    return new Container(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: new Card(
        child: new Container(
    padding: const EdgeInsets.all(20.0),
  child: Column(
    children: <Widget>[this.title, this.v, this.icon],
  ),
  )
  )
    );
  }
}  
