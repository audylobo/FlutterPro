import 'package:flutter/material.dart';

class CustomDropwDownList extends StatelessWidget {
  CustomDropwDownList({
    @required this.data,
    @required this.provider,
    @required this.functionChange,
    @required this.validator,
  });
  final List<String> data;
  final String provider;
  final Function functionChange;
  final String validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Color(0xff7FBEEB),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
          ),

          style: TextStyle(
            color: Colors.blue,
            fontSize: 15.0,
          ),
          isExpanded: true,
          validator: (value) {
            if (value == "Seleccionar") {
              return '' + validator.toString();
            }
            return null;
          },
          // underline: Container(),
          hint: Text(
            provider,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15.0,
            ),
          ),
          items: data.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15.0,
                ),
              ),
            );
          }).toList(),
          onChanged: functionChange,
        ),
      ),
    );
  }
}
