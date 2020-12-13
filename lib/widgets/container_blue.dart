import 'package:flutter/material.dart';

class ContainerBlue extends StatelessWidget {
  
  final Widget child;

  const ContainerBlue({ this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: EdgeInsets.only(left: 10.0, right: 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Color(0xff7FBEEB),
          ),
        ),child: child,);
  }
}
