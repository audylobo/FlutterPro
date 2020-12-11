import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final double width;
  final String texto;
  final Color color;
  final Function function;

  const BottomBar({this.width, this.texto, this.color, this.function});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      color: color,
      height: 60,
      minWidth: width,
      onPressed: () {
        function();
      },
      child: Text(texto,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }
}
