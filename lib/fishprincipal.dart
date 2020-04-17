import 'package:drawer_menu/models/user_model.dart';
import 'package:drawer_menu/services/auth_service.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:drawer_menu/font_awesome_flutter.dart';
import 'package:drawer_menu/menu/lagos.dart';
import 'package:drawer_menu/menu/sensor.dart';
import 'package:drawer_menu/menu/settings.dart';
import 'package:drawer_menu/pages/fishes/fishP.dart';
import 'package:provider/provider.dart';

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
                Navigator.of(context).pushNamed(route);
              }
            });
          });
    }

    // Drawer
    return Drawer(
        child: ListView(children: <Widget>[
      header,
      _getItem(new Icon(FontAwesomeIcons.bars), 'Reporte', "/report"),
      _getItem(new Icon(Icons.live_help), 'Ayuda', "/ayuda"),
      Divider(),
      _getItem(new Icon(Icons.exit_to_app), 'Cerrar sesión', "cerrar"),
      info
    ]));
  }

  TabController _tabController;
  var user;
  var userRol;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    DatabaseService(user.uid).getUserData().then((document) {
      setState(() {
        userRol = document.data['rol'].toString();
      });
    });

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Uribe Paraco"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
        bottom: new TabBar(controller: _tabController, tabs: <Widget>[
          new Tab(icon: new Icon(FontAwesomeIcons.tint)),
          new Tab(icon: new Icon(FontAwesomeIcons.fish)),
          new Tab(icon: new Icon(Icons.speaker_phone)),
          new Tab(icon: new Icon(Icons.settings))
        ]),
      ),
      drawer: _getDrawer(context, user),
      body: new TabBarView(controller: _tabController, children: <Widget>[
        new Lagos(),
        new Fishp(),
        new Sensor(),
        new Settings(),
      ]),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "La busqueda debe tener mas de 2 letras.",
            ),
          )
        ],
      );
    }

    //Add the search term to the searchBloc.
    //The Bloc will then handle the searching and add the results to the searchResults stream.
    //This is the equivalent of submitting the search term to whatever search service you are using

    return Column(
      children: <Widget>[
        //Build the results based on the searchResults stream in the searchBloc
        StreamBuilder(
          // stream: InheritedBlocs.of(context).searchBloc.searchResults,
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (!snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else if (snapshot.data.length == 0) {
              return Column(
                children: <Widget>[
                  Text(
                    "No se encontraron resultados.",
                  ),
                ],
              );
            } else {
              var results = snapshot.data;
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  var result = results[index];
                  return ListTile(
                    title: Text(result.title),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}
