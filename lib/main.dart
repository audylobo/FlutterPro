import 'package:drawer_menu/wraper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drawer_menu/models/user_model.dart';
import 'package:drawer_menu/services/auth_service.dart';
import 'package:drawer_menu/fishprincipal.dart';
import 'package:drawer_menu/pages/fishes/fishP.dart';
import 'package:drawer_menu/pages/help.dart';
import 'package:drawer_menu/pages/report.dart';
import 'package:drawer_menu/pages/login_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        localizationsDelegates: [CustomLocalizationDelegate()],
        title: 'Peces App',
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes: <String, WidgetBuilder>  {        
          Report.routeName:  (BuildContext context) => new Report(),
          Help.routeName:  (BuildContext context) => new Help(),
          FishPrincipal.routeName: (BuildContext context) => new FishPrincipal(),
          Fishp.routeName: (BuildContext context) => new Fishp(),
          LoginPage.routeName: (BuildContext context) => LoginPage(),
        }  
      ),
    );
  }
}


class CustomLocalizationDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<MaterialLocalizations> load(Locale locale) => SynchronousFuture<MaterialLocalizations>(const CustomLocalization());

  @override
  bool shouldReload(CustomLocalizationDelegate old) => false;

  @override
  String toString() => 'CustomLocalization.delegate(en_US)';
}

class CustomLocalization extends DefaultMaterialLocalizations {
  const CustomLocalization();

  @override
  String get searchFieldLabel => "Buscar peces";
}
