import 'package:flutter/material.dart';
import 'package:drawer_menu/font_awesome_flutter.dart';
class Principal extends StatefulWidget{
   static const String routeName = "/principal";
   
       @override
       _PrincipalState createState() => new _PrincipalState();
       
     }
   class  _PrincipalState extends State<Principal> {
     Drawer _getDrawer(BuildContext context)
     {
       var header = new DrawerHeader(child: new Text("Test") );
       var info = new AboutListTile(
         child: new Text("Acerca de"),
         applicationVersion: "v1.1.5",
         applicationName: "Monitoreo en Pruebas",
         applicationIcon: new Icon(Icons.info_outline),
         icon: new Icon(Icons.info),
       );
       ListTile _getItem(Icon icon,String description, String route){
         return new ListTile(
           leading: icon,
           title: new Text(description),
           onTap: () {
             setState((){
               Navigator.of(context).pushNamed(route);
             });
           }
         );

       }

       ListView listView = new ListView(children: <Widget>[
         header,
        _getItem(new Icon(Icons.home), 'Principal', "/principal"),
         _getItem(new Icon(FontAwesomeIcons.atom), 'Sensores', "/sensores"),
         _getItem(new Icon(FontAwesomeIcons.fish), 'Peces', "/peces"),
         _getItem(new Icon(FontAwesomeIcons.water), 'Lagos', "/lagos"),
         _getItem(new Icon(Icons.settings_applications), 'Configuracion', "/configuracion"),
         _getItem(new Icon(FontAwesomeIcons.bars), 'Reporte', "/report"),
         _getItem(new Icon(Icons.live_help), 'Ayuda', "/ayuda"),
         _getItem(new Icon(Icons.exit_to_app), 'Cerrar', "/salir"),

        info
        ]);
        return new Drawer(
          child: listView,
          );
       }
       @override
       Widget build(BuildContext context){
          return new Scaffold(
           appBar: new AppBar(
             title: new Text ("Menu"),
              backgroundColor: Colors.black,
           ),

        drawer: _getDrawer(context),
        );

       }
       }
       
    