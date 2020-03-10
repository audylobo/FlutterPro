import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_Belo.dart';
import 'package:flutter/material.dart';
import 'package:drawer_menu/pages/fishes/fish.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_abanico.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_carpin.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_Celestial.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_Cometa.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_Comun.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_Oranda.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_perla.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_phoenix.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_pompom.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_ranchu.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_ryuoku.dart';
import 'package:drawer_menu/pages/fishes/fishDorado/Dorado_Telescopio.dart';


class Dorados extends StatelessWidget {
  static const String routeName = "/dorados";
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
        title: new Text("Doradas"),
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
            image: AssetImage("assets/images/Dorado_abanico.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Abanico",
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
              new MaterialPageRoute(builder: (context) => new DoradoAban()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_carpin.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Carpin",
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
              new MaterialPageRoute(builder: (context) => new DoradoCarpi()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_celestial.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Celestial",
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
              new MaterialPageRoute(builder: (context) => new DoradoCeles()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_comun.png"),
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
              new MaterialPageRoute(builder: (context) => new DoradoComu()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_cometa.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Cometa",
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
              new MaterialPageRoute(builder: (context) => new DoradoComet()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_oranda.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Oranda",
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
              new MaterialPageRoute(builder: (context) => new DoradoOran()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_perla.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Perla",
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
              new MaterialPageRoute(builder: (context) => new DoradoPerl()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_phoenix.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Phoenix",
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
              new MaterialPageRoute(builder: (context) => new DoradoPhoe()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_pompom.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Pompom",
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
              new MaterialPageRoute(builder: (context) => new DoradoPom()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_ranchu.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Ranchu",
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
              new MaterialPageRoute(builder: (context) => new DoradoRan()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_ryukin.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Ryuki",
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
              new MaterialPageRoute(builder: (context) => new DoradoRyu()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_telescopio.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Telescopio",
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
              new MaterialPageRoute(builder: (context) => new DoradoTeles()));
            },
            ),
            
            ),

            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Dorado_velo.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Velo",
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
              new MaterialPageRoute(builder: (context) => new DoradoVel()));
            },
            ),
            
            ),
           
  ],
    ),
    ),
    );
    
  }
}