

import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {

  final String componente;

  final String title;

  CustomRichText({
    
    @required this.componente, @required this.title});

  @override
  RichText build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title ',
        style: new TextStyle(
          color: Colors.blue,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: "Gilroy-Regular",
        ),
        children: <TextSpan>[
          TextSpan(
            text: '$componente',
            style: new TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.blue,
                fontFamily: "Gilroy-Regular",
                fontSize: 15),
          )
        ],
      ),
    );
  }
}
