import 'package:drawer_menu/services/push_service.dart';
import 'package:drawer_menu/wraper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:drawer_menu/models/user_model.dart';
import 'package:drawer_menu/services/auth_service.dart';
import 'package:drawer_menu/fishprincipal.dart';
import 'package:drawer_menu/pages/fishes/fishP.dart';
import 'package:drawer_menu/pages/help.dart';
import 'package:drawer_menu/pages/report.dart';
import 'package:drawer_menu/pages/login_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pushProvider = new PushNotificationService(); 
  
  

  @override
  void initState() {
    super.initState();    
    pushProvider.initNotifications();
  }

  @override
  Widget build(BuildContext context) {
      
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PushNotificationService>(create: (context) => pushProvider, ),
        StreamProvider.value(value: AuthService().user),
      ],
      child: MaterialApp(
        title: 'Fish life',
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes: <String, WidgetBuilder>  {        
          '/report':  (BuildContext context) => new Report(),
          Help.routeName:  (BuildContext context) => new Help(),
          FishPrincipal.routeName: (BuildContext context) => new FishPrincipal(),
          Fishp.routeName: (BuildContext context) => new Fishp(),
          LoginPage.routeName: (BuildContext context) => LoginPage(),
        }  
      ),
    );
  }

  @override
  void dispose() { 
    pushProvider.closeStream();
    super.dispose();
  }
}