import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService with ChangeNotifier {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final _messageStreamController = StreamController<String>.broadcast();

  String pushToken;

  
  Future<void> _showNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics,
        payload: 'item x');
  }
  
  Stream<String> get message => _messageStreamController.stream;

  void closeStream() {
    _messageStreamController.close();
  }

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();
    _initialiceNotifications();
  
    _firebaseMessaging.getToken()
      .then( (token) {
        pushToken = token;
      });

      _firebaseMessaging.configure(

        onMessage: (info)  {
          _messageStreamController.sink.add(info['notification']['body']);
          _showNotification(info['notification']['title'], info['notification']['body']);
          return;
        },

        onLaunch: (info) {
          _messageStreamController.sink.add(info['notification']['body']);
          print('onLaunch');
          return;
        },

        onResume: (info) {
          _messageStreamController.sink.add(info['notification']['body']);
          print('onResume');
          return;
        }

      );
  }

  _initialiceNotifications() async {        
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future onDidReceiveLocalNotification(int a, String b, String c, String d) {
    
  }

  Future selectNotification(String payload) {

  }


  
  
}