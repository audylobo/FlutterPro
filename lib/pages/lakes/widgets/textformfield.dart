import 'package:flutter/material.dart';

class FormFieldLake extends StatelessWidget {
  //final String initialValue;
  final TextEditingController controller;
  final String labelText;

  FormFieldLake({ 
    @required this.labelText,
    @required this.controller});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: '$labelText',
        
      ),
    );
  }

}
