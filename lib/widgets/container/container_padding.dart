


import 'package:flutter/material.dart';

class ContainerPadding extends StatelessWidget {
  
  final Widget child;

  const ContainerPadding({@required this.child});
  

  @override
  Container build(BuildContext context) {
    
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(padding: const EdgeInsets.all(10.0), child: child));
  
  }
}