
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

class CustomToast {
  void show(
    String mensaje,
    Color backgroundcolor,
    Color textcolor,
  ) {
    Fluttertoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundcolor,
      textColor: textcolor,
      fontSize: 20,
    );
  }

  cerrar() async {
    await Fluttertoast.cancel().then((isHidden) {});
  }
}
