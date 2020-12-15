


import 'package:flutter/material.dart' ;

class PickerDate {
  // ignore: missing_return
  Future<DateTime> pickDate(
      BuildContext context, DateTime selectedDate, String helpText) async {
    final DateTime picked = await showDatePicker(
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Color(0xFFC42E2E),
                onPrimary: Colors.white,
                surface: Colors.blue,
                onSurface: Colors.white,
              ),
              dialogBackgroundColor: Colors.blue,
            ),
            child: child,
          );
        },
        context: context,
        helpText: helpText,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      return selectedDate;
    }

     if (picked == null) {
     
      return selectedDate;
    }

   
  }

  
}
