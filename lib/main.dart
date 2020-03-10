import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:drawer_menu/fishprincipal.dart';
import 'package:drawer_menu/pages/fishes/fishP.dart';
import 'package:drawer_menu/pages/help.dart';
import 'package:drawer_menu/pages/report.dart';
import 'package:drawer_menu/pages/login_page.dart';


void main(){ 

  runApp(new MaterialApp(
    home: new MyApp(),
    debugShowCheckedModeBanner: false,
  ));

}
class MyApp extends StatefulWidget{
@override 
_MyAppState createState() => new _MyAppState();

}

 class _MyAppState extends State<MyApp>{
@override 
 Widget build(BuildContext context){

   return new  MaterialApp(
     theme: new ThemeData(
       primaryColor: new Color(0xFF99B8D1),
       accentColor: new Color(0xFF03023B),
       buttonTheme: ButtonThemeData(height: 50),
textTheme: TextTheme(
       subhead: TextStyle (
         fontSize:18,
         ),
         button: TextStyle(fontSize: 16,
         ))),
   
   
    
     home: MyHomePage(),
      routes: <String, WidgetBuilder>  {
  
  Report.routeName:  (BuildContext context) => new Report(),
Help.routeName:  (BuildContext context) => new Help(),
FishPrincipal.routeName: (BuildContext context) => new FishPrincipal(),
Fishp.routeName: (BuildContext context) => new Fishp(),
MyHomePage.routeName: (BuildContext context) => MyHomePage(),
    }
    
    );
    
 }
 }

 