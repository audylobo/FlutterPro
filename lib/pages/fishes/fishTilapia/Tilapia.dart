import 'package:drawer_menu/pages/fishes/fishTilapia/Tilapia_Comun.dart';
import 'package:drawer_menu/pages/fishes/fishTilapia/Tilapia_Nilo.dart';
import 'package:drawer_menu/pages/fishes/fishTilapia/Tilapia_Rosada.dart';
import 'package:drawer_menu/pages/fishes/fishTilapia/tilapia_Azul.dart';
import 'package:flutter/material.dart';
import 'package:drawer_menu/pages/fishes/fish.dart';


class Tilapia extends StatelessWidget {
  static const String routeName = "/tilapia";
  String pezverde;
  
  
  List<String> event = [
    "pez",
    "Dorado",
    "Amarillo",
    "tilapia"

  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text("Tilapias"),
         backgroundColor: Colors.blue.shade600 
      ),
      body: Center(
        child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(7) ,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Tilapia.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Comun",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             )
            ],
          ),
            padding: EdgeInsets.only(right: 45.0, top:110,),
            onPressed:(){
              Navigator.push(
                context,
              new MaterialPageRoute(builder: (context) => new TiComun()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Tilapia_azul.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Azul",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             )
            ],
          ),
            padding: EdgeInsets.only(right: 45.0, top:110,),
            onPressed:(){
              Navigator.push(
                context,
              new MaterialPageRoute(builder: (context) => new TiAzul()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Tilapia_nilo.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Nilo",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             )
            ],
          ),
            padding: EdgeInsets.only(right: 45.0, top:110,),
            onPressed:(){
              Navigator.push(
                context,
              new MaterialPageRoute(builder: (context) => new TiNilo()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Tilapia_roja.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Pez negro",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             )
            ],
          ),
            padding: EdgeInsets.only(right: 45.0, top:110,),
            onPressed:(){
              Navigator.push(
                context,
              new MaterialPageRoute(builder: (context) => new TiRosa()));
            },
            ),
            
            ),
            
  ],
    ),
    ),
    );
    
  }
}