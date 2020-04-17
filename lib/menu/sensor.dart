import 'package:flutter/material.dart';
import 'package:drawer_menu/menu/sensores/sensorA.dart';

class Sensor extends StatelessWidget{
  static const String routeName = "/sensores";
  @override
  Widget build(BuildContext context){
     final double iconSize = 80.0;

     
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sensores"), 
         backgroundColor: Colors.lightGreen,
        ),
         body: Center(
            child:Container(
     
     
      child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(0.0),
        child:Image.asset("assets/images/p.jpg",
         fit: BoxFit.cover,
          color: Colors.black54,
           colorBlendMode: BlendMode.darken,
          ),
        ),
      
      GridView.count(
        primary: false,
        padding: const EdgeInsets.all(5) ,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(10),
      width: 500.0,
      height: 500.0,
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            
            children: <Widget>[
              new MyCard(icon: new Icon(Icons.speaker_phone,size:iconSize, color:Colors.blue),
              
              text:new Text("Sensor",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             ),
             text1:new Text("Temperatura",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             ), 
              ),
            ],
          ),
            padding: EdgeInsets.only(right: 20, top:20,),
            onPressed:(){
              Navigator.push(
                context,
              new MaterialPageRoute(builder: (context) => new SensorA()));
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(10),
      width: 500.0,
      height: 500.0,
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            
            children: <Widget>[
              new MyCard(icon: new Icon(Icons.speaker_phone,size:iconSize, color:Colors.blue),
              
              text:new Text("Sensor",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             ),
             text1:new Text("Ph",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             ), 
              ),
            ],
          ),
            padding: EdgeInsets.only( right: 35,top:20,),
            onPressed:(){
            },
            ),
            
            ),
            Container(
      padding: const EdgeInsets.all(10),
      width: 500.0,
      height: 500.0,
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            
            children: <Widget>[
              new MyCard(icon: new Icon(Icons.speaker_phone,size:iconSize, color:Colors.blue),
              
              text:new Text("Sensor",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             ),
             text1:new Text("Temperatura",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             ), 
              ),
            ],
          ),
            padding: EdgeInsets.only(right: 20, top:20,),
            onPressed:(){
            },
            ),
            
            ),
           Container(
      padding: const EdgeInsets.all(10),
      width: 500.0,
      height: 500.0,
           

          child: FlatButton( child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            
            children: <Widget>[
              new MyCard(icon: new Icon(Icons.speaker_phone,size:iconSize, color:Colors.blue),
              
              text:new Text("Sensor",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             ),
             text1:new Text("Temperatura",
             textAlign: TextAlign.start,
             style:TextStyle(
               color: Colors.black, fontSize: 20.0),
             ), 
              ),
            ],
          ),
            padding: EdgeInsets.only(right:35, top:20),
            onPressed:(){
              
            },
            ),
            
            ),
            
          
           
           
  ],
    ),
      ]
    ),
          
    ),
      
         ),
            

    );
  }
}


class MyCard extends StatelessWidget{
  
  final Widget icon;
  final Widget text;
  final Widget text1;
 
  
  MyCard({this.icon, this.text, this.text1});
  
  @override
Widget build(BuildContext context){

    return new Container(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: new Card(
        child: new Container(
    padding: const EdgeInsets.all(1.0),
  child: Column(
    children: <Widget>[ this.icon, this.text, this.text1],
  ),
  )
  )
    );
  }
}  