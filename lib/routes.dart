import 'package:drawer_menu/pages/sensor/pages/edit_nivel_agua.dart';
import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'pages/registro.dart';
import 'pages/report.dart';
import 'pages/sensor/pages/create_sensor.dart';
import 'pages/sensor/pages/edit_oxigeno.dart';
import 'pages/sensor/pages/edit_ph.dart';
import 'pages/sensor/pages/edit_temperatura.dart';

class Routes {
  static const String login = '/';
  static const String registro = 'registro';
  static const String reportes = 'reportes';

  static const String crearSensor = 'crearSensor';

  //ROUTAS PARA EL CRUD DE LOS SENSORES

  static const String editEditNivelAgua = "EditNivelAgua";

  static const String editSensorOxigeno = "EditSensorOxigeno";

  static const String editSensorTemperatura = "EditSensorTemperatura";

  static const String editSensorPH = "EditSensorPH";

  //
  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    switch (settings.name) {

      case editSensorPH:
        return MyCustomRoute(
          builder: (_) => EditSensorPH(
            item: settings.arguments,
          ),
        );

      case editSensorTemperatura:
        return MyCustomRoute(
          builder: (_) => EditSensorTemperatura(
            item: settings.arguments,
          ),
        );

      case editSensorOxigeno:
        return MyCustomRoute(
          builder: (_) => EditSensorOxigeno(
            item: settings.arguments,
          ),
        );

      case editEditNivelAgua:
        return MyCustomRoute(
          builder: (_) => EditNivelAgua(
            item: settings.arguments,
          ),
        );

      case crearSensor:
        return MyCustomRoute(
          builder: (_) => CreateSensor(),
        );

      case reportes:
        return MyCustomRoute(
          builder: (_) => Report(),
        );

      case registro:
        return MyCustomRoute(
          builder: (_) => Registro(),
        );

      case login:
        return MyCustomRoute(
          builder: (_) => LoginPage(),
        );
    }
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder}) : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child, // child is the value returned by pageBuilder
    );
  }
}
