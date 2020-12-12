import 'package:flutter/material.dart';

class CustomBarActions extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  final Function functionEdit;
  final Function fuctionDelete;

  final String title;

  CustomBarActions(
      {@required this.appBar,
      @required this.functionEdit,
      @required this.fuctionDelete,
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
            Icons.palette,
          ),
          onPressed: () => functionEdit(),
        ),
        IconButton(
          icon: Icon(
            Icons.delete,
          ),
          onPressed: () {
            fuctionDelete();
          },
        ),
      ],
    );
  }
}
