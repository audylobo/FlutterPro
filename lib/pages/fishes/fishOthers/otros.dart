
import 'package:drawer_menu/pages/fishes/fishOthers/Bocachico.dart';
import 'package:drawer_menu/pages/fishes/fishOthers/Corocoro.dart';
import 'package:drawer_menu/pages/fishes/fishOthers/Corroncho.dart';
import 'package:drawer_menu/pages/fishes/fishOthers/Leporino.dart';
import 'package:drawer_menu/pages/fishes/fishOthers/Pirarocu.dart';
import 'package:drawer_menu/pages/fishes/fishOthers/Rollizo.dart';
import 'package:drawer_menu/pages/fishes/fishOthers/Sabaleta.dart';
import 'package:drawer_menu/pages/fishes/fishOthers/Sabalo.dart';
import 'package:drawer_menu/pages/fishes/fishOthers/Sapoara.dart';
import 'package:drawer_menu/pages/fishes/fishOthers/Sardinata.dart';
import 'package:drawer_menu/pages/fishes/fishOthers/Yamu.dart';
import 'package:flutter/material.dart';
import 'package:drawer_menu/pages/fishes/fish.dart';



class Otros extends StatelessWidget {
  static const String routeName = "/otros";
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
        title: new Text("Otros peces"),
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
            image: AssetImage("assets/images/Corocoro.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Corocoro",
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
              new MaterialPageRoute(builder: (context) => new Coroco()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Corroncho.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Corroncho",
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
              new MaterialPageRoute(builder: (context) => new Corron()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Leporino.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Leporino",
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
              new MaterialPageRoute(builder: (context) => new Lepori()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Pirarocu.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Pirarocu",
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
              new MaterialPageRoute(builder: (context) => new Pira()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Rollizo.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Rollizo",
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
              new MaterialPageRoute(builder: (context) => new Rolliz()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Sabaleta.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Sabaleta",
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
              new MaterialPageRoute(builder: (context) => new Sabale()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Sabalo.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Sabalo",
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
              new MaterialPageRoute(builder: (context) => new Sabal()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Sapoara.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Sapoara",
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
              new MaterialPageRoute(builder: (context) => new Sapoa()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Sardinata.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Sardinata",
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
              new MaterialPageRoute(builder: (context) => new Sardina()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Yamu.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Yamu",
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
              new MaterialPageRoute(builder: (context) => new Yam()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/bobachico.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Bocachico",
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
              new MaterialPageRoute(builder: (context) => new Bocachi()));
            },
            ),
            
            ),
           
           
  ],
    ),
    ),
    );
    
  }
}