


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField({
    @required this.controller,
    @required this.label,
    @required this.inputType,
    @required this.icono,
  });

  final TextEditingController controller;
  final String label;

  final TextInputType inputType;
  final IconData icono;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Requerido $label';
          }
          return null;
        },
        keyboardType: inputType,
        obscureText: label == "Password" ? true : false,
        controller: controller,
        cursorColor: Colors.blue,
        style: TextStyle(
         
          color: Colors.blue,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icono,
         color: Colors.blue,
            size: 25,
          ),
          hintText: label,
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
              fontWeight: FontWeight.w600),
          contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 17),
          focusColor:   Colors.blue,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color:  Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey[350],
            ),
          ),
        ));
  }
}
