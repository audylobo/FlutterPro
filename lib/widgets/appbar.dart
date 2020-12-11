import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  final Function function;

  final String title;

  CustomBar(
      {@required this.appBar, @required this.function, @required this.title});

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      centerTitle: true,
      title: Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          )),
    );
  }
}
