import 'package:flutter/material.dart';
import 'package:drawer_menu/pages/fishes/fish.dart';
import 'package:drawer_menu/pages/fishes/fishArawana/arawana_afri.dart';
import 'package:drawer_menu/pages/fishes/fishArawana/arawana_austri.dart';
import 'package:drawer_menu/pages/fishes/fishArawana/arawana_comun.dart';
import 'package:drawer_menu/pages/fishes/fishArawana/arawana_albi.dart';
import 'package:drawer_menu/pages/fishes/fishArawana/arawana_neg.dart';
class Arawanas extends StatelessWidget {
  static const String routeName = "/Arawanas";
  String pezverde;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text("peces Arawanas"),
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
            image: AssetImage("assets/images/Arawana_africana.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Africana",
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
              new MaterialPageRoute(builder: (context) => new ArawanaAfricana()));
            },
            ),
            
            ),

           Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Arawana_australiana.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Australiana",
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
              new MaterialPageRoute(builder: (context) => new ArawanaAustri()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Arawana_comun.png"),
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
              new MaterialPageRoute(builder: (context) => new ArawanaCom()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Arawana_negra.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Negro",
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
              new MaterialPageRoute(builder: (context) => new Arawananegr()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Arrawana_Albina.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Albina",
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
              new MaterialPageRoute(builder: (context) => new ArawanaAlbi()));
            },
            ),
            
            ),
          
  ],
    ),
    ),
    );
    
  }
}