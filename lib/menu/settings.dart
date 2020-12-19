import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drawer_menu/models/user_model.dart';
import 'package:drawer_menu/services/streams/stream_sensor_temperatura.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class Settings extends StatefulWidget {
  static const String routeName = "/configuracion";

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  StreamSensorTemperatura myStream = new StreamSensorTemperatura();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    if (user.userActual.rol == "admin") {
      return FutureBuilder<List<User>>(
          future: myStream.getAllUser(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<User> list = snapshot.data;

            return ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (_, int i) {
                return ListTile(
                  leading: customIcon(list[i].rol),
                  title: Text(list[i].email),
                  subtitle: Text(list[i].rol),
                  trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      elevation: 10,
                      padding: const EdgeInsets.all(0.0),
                      itemBuilder: (_) => <PopupMenuItem<String>>[
                            PopupMenuItem<String>(
                                child: const Text('Administrador'),
                                value: 'admin'),
                            PopupMenuItem<String>(
                                child: const Text('Usuario'), value: 'usuario'),
                            PopupMenuItem<String>(
                                child: const Text('Trabajador'),
                                value: 'trabajador'),
                          ],
                      onSelected: (value) {
                        Firestore.instance
                            .collection("users")
                            .document(list[i].uid)
                            .updateData({
                          "rol": value,
                        }).then((value) {
                          setState(() {});
                        });
                      }),
                );
              },
            );
          });
    } else
      return Container();
  }

  Icon customIcon(String rol) {
    switch (rol) {
      case "admin":
        return Icon(Icons.people, color: Colors.blue);
        break;

      case "usuario":
        return Icon(Icons.emoji_people, color: Colors.green);
        break;

      case "trabajador":
        return Icon(Icons.person_pin_circle, color: Colors.red);
        break;
      default:
    }
  }
}
