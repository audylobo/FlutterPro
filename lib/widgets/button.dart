import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    @required this.scrWidth,
    @required this.function,
    @required this.title,
    @required this.customColor,
  });

  final double scrWidth;
  final Function function;
  final String title;

  final Color customColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: customColor,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      minWidth: scrWidth * 0.90,
      height: 50,
      onPressed: () async => function(),
      child: Text(
        '$title',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
