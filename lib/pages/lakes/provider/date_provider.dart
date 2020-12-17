import 'package:flutter/material.dart' show ChangeNotifier;

class DateProvider with ChangeNotifier {
  DateTime _date = DateTime.now();

  get getDate {

    if (_date == null) return DateTime.now().toLocal(); 
    return _date?.toLocal();
  }

  set setDate(DateTime dato) {
    this._date = dato;
    notifyListeners();
  }





}
