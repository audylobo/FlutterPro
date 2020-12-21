import 'package:drawer_menu/models/user_model.dart';
import 'package:drawer_menu/pages/fishes/searchFish.dart';
import 'package:drawer_menu/services/auth_service.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:flutter/material.dart';

import 'package:drawer_menu/menu/lagos.dart';
import 'package:drawer_menu/menu/sensor.dart';
import 'package:drawer_menu/menu/settings.dart';
import 'package:drawer_menu/pages/fishes/fishP.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

import 'font_awesome_flutter.dart';

class FishPrincipal extends StatefulWidget {
  static const String routeName = "/fishprincipal";
  @override
  _FishPrincipalState createState() => new _FishPrincipalState();
}

class _FishPrincipalState extends State<FishPrincipal>
    with SingleTickerProviderStateMixin {
  AuthService _authService = AuthService();

  Drawer _getDrawer(BuildContext context, User user) {
    // User context

    // User displayName
    var userName = user.name != null ? user.name : 'Usuario';

    // User Picture
    var userPicture = user.picture != null
        ? CircleAvatar(
            backgroundImage: NetworkImage(user.picture),
          )
        : CircleAvatar(
            child: Icon(FontAwesomeIcons.user, color: Colors.white70),
            foregroundColor: Colors.white,
          );

    // Drawer Header
    var header = DrawerHeader(
        padding: EdgeInsets.all(0.0),
        child: UserAccountsDrawerHeader(
          currentAccountPicture: userPicture,
          accountEmail: Text(user.email),
          accountName: Text(userName),
        ));

    // About info
    var info = new AboutListTile(
      child: new Text("Acerca de"),
      applicationVersion: "v1.4.5",
      applicationName: "Monitoreo en Pruebas",
      applicationIcon: new Icon(Icons.info_outline),
      icon: new Icon(Icons.info),
    );

    // Drawer get items
    ListTile _getItem(Icon icon, String description, String route) {
      return new ListTile(
          leading: icon,
          title: new Text(description),
          onTap: () {
            setState(() {
              if (route == 'cerrar') {
                _authService.singOut();
              } else {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(route);
              }
            });
          });
    }

    // Drawer
    return Drawer(
        child: ListView(children: <Widget>[
      header,
      _getItem(new Icon(FontAwesomeIcons.bars), 'Reporte', "reportes"), 
      _getItem(new Icon(Icons.live_help), 'Ayuda', "/ayuda"),
      Divider(),
      _getItem(new Icon(Icons.exit_to_app), 'Cerrar sesión', "cerrar"),
      info
    ]));
  }

  TabController _tabController;

  var userRol;

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return new Scaffold(
      appBar: new AppBar(
          title: Text('Fish life'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Home()));
              },
            ),
          ],
          bottom: new TabBar(controller: _tabController, tabs: <Widget>[
            new Tab(
              icon: new Icon(FontAwesomeIcons.tint),
              text: 'Lagos',
            ),
            new Tab(
              icon: new Icon(FontAwesomeIcons.fish),
              text: 'Peces',
            ),
            new Tab(
              icon: new Icon(Icons.speaker_phone),
              text: 'Sensores',
            ),
            new Tab(
              icon: new Icon(Icons.settings),
              text: 'Configuración',
            )
          ])),
      drawer: _getDrawer(context, user),
      body: FutureBuilder(
        future: DatabaseService(user.uid).getUserData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError || !snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          user.userActual = User.fromSnapshot(snapshot.data);
          userRol = snapshot.data['rol'].toString();
          return TabBarView(controller: _tabController, children: <Widget>[
            new Lagos(),
            new Fishp(
              userRol: userRol,
            ),
            if (user.userActual.rol == "usuario") ...{
              Container(),
            } else ...{
              new Sensor(),
            },
            new Settings(),
          ]);
        },
      ),
    );
  }
}
