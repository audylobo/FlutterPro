import 'package:flutter/material.dart';
import 'package:drawer_menu/pages/fishes/fish.dart';
import 'package:drawer_menu/pages/fishes/fishMojarra/Albina.dart';
import 'package:drawer_menu/pages/fishes/fishMojarra/Tira.dart';


class Mojarra extends StatelessWidget {
  static const String routeName = "/mojarra";
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
        title: new Text("Mojarras"),
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
            image: AssetImage("assets/images/Mojarra_albina.png"),
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
              new MaterialPageRoute(builder: (context) => new MojarraAlbi()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/Mojarra_tira.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Tira",
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
              new MaterialPageRoute(builder: (context) => new MojaTi()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(8),
      width: 174.0,
      height: 174.0,

        decoration: BoxDecoration( 
          image: DecorationImage(
            image: AssetImage("assets/images/2Amarillo.png"),
            ),
            ),
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Pez azul",
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
              new MaterialPageRoute(builder: (context) => new Pez()));
            },
            ),
            
            ),
            
           
  ],
    ),
    ),
    );
    
  }
}