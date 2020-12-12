import 'dart:io';

import 'package:flutter/material.dart' show TextEditingController;

class SensorOxigenoProvider {
  TextEditingController textReferencia = new TextEditingController();
  TextEditingController textVOLTAJE = new TextEditingController();
  TextEditingController textPrecioVoltaje = new TextEditingController();
  TextEditingController textRangoDeteccionVoltaje = new TextEditingController();
  TextEditingController textRangoPrecisionVoltaje = new TextEditingController();

  File _image;

  String _resistenciaAgua = "Seleccionar";

  SensorOxigenoProvider(String referencia, String voltaje, String precio,
      String resistenciaAgua, String deteccion, String precision) {
    textReferencia.text = referencia;
    textVOLTAJE.text = voltaje;
    textPrecioVoltaje.text = precio;
    _resistenciaAgua = resistenciaAgua;

    textRangoDeteccionVoltaje.text = deteccion;
    textRangoPrecisionVoltaje.text = precision;
  }

  get image {
    return _image;
  }

  set setImage(File dato) {
    this._image = dato;
  }

  get resistenciaAgua {
    return _resistenciaAgua;
  }

  set setResistencia(String dato) {
    this._resistenciaAgua = dato;
  }
}
