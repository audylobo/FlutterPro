import 'package:flutter/material.dart';

class CustomBarAdd extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  final Function function;
 
  final String title;

  CustomBarAdd(
      {@required this.appBar,
      @required this.function,
    
      @required this.title});

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
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      actions: [
        IconButton(
          icon: Icon(
            Icons.save,
          ),
          onPressed: () => function(),
        ),
      
      ],
    );
  }
}
