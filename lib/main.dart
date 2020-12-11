import 'package:drawer_menu/routes.dart';
import 'package:drawer_menu/services/push_service.dart';
import 'package:drawer_menu/utils/wraper.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:drawer_menu/services/auth_service.dart';


import 'pages/sensor/provider/sensor_provider.dart';


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
         ListenableProvider<CreateProviderSensor>(create: (_) => CreateProviderSensor()),
        ChangeNotifierProvider<PushNotificationService>(create: (context) => pushProvider, ),
        StreamProvider.value(value: AuthService().user),
      ],
      child: MaterialApp(
        title: 'Fish life',
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        onGenerateRoute: Routes.generateRoute,
      /*   routes: <String, WidgetBuilder>  {        
          '/report':  (BuildContext context) => new Report(),
          Help.routeName:  (BuildContext context) => new Help(),
          FishPrincipal.routeName: (BuildContext context) => new FishPrincipal(),
          Fishp.routeName: (BuildContext context) => new Fishp(),
          LoginPage.routeName: (BuildContext context) => LoginPage(),
        }   */
      ),
    );
  }

  @override
  void dispose() { 
    pushProvider.closeStream();
    super.dispose();
  }
}