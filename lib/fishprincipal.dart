import 'package:flutter/material.dart';
import 'package:drawer_menu/font_awesome_flutter.dart';
import 'package:drawer_menu/menu/lagos.dart';
import 'package:drawer_menu/menu/sensor.dart';
import 'package:drawer_menu/menu/settings.dart';
import 'package:drawer_menu/pages/fishes/fishP.dart';
import 'package:drawer_menu/pages/login_page.dart';


class FishPrincipal extends StatefulWidget {
   static const String routeName = "/fishprincipal";
  @override
  _FishPrincipalState createState() => new _FishPrincipalState();
}
class _FishPrincipalState extends State<FishPrincipal> with SingleTickerProviderStateMixin{

Drawer _getDrawer(BuildContext context)
     {
       var header = new DrawerHeader(child: new Text("menu") );
       var info = new AboutListTile(
         child: new Text("Acerca de"),
         applicationVersion: "v1.4.5",
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
        

         _getItem(new Icon(FontAwesomeIcons.bars), 'Reporte', "/report"),
         _getItem(new Icon(Icons.live_help), 'Ayuda', "/ayuda"),
         _getItem(new Icon(Icons.exit_to_app), 'Cerrar', "/MyHomePage"),
       

        info
        ]);
        return new Drawer(
          child: listView,
          );
       }


TabController _tabController;
 
  @override
  void initState(){
    super.initState();
    _tabController= new TabController(vsync: this, initialIndex: 1, length: 4);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:  Text("Uribe Paraco"),
        bottom: new TabBar(
         controller: _tabController,
          tabs: <Widget>[
          new Tab(icon: new Icon(FontAwesomeIcons.tint)),
          new Tab(icon: new Icon(FontAwesomeIcons.fish)),
          new Tab(icon: new Icon(Icons.speaker_phone)),
          new Tab(icon: new Icon(Icons.settings))
        ],
        ),
        ),
 drawer: _getDrawer(context),
             body: new TabBarView(
      controller: _tabController,
      children: <Widget>[
      new Lagos(),
      new  Fishp(),
      new Sensor(),
      new Settings(),
      ],
      ),
      
    );
  }
}
 
    
       
    