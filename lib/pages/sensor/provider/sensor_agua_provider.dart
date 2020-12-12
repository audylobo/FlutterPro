import 'dart:io';

import 'package:flutter/material.dart' show TextEditingController;

class SensorProviderAgua {
  TextEditingController textReferencia      = new TextEditingController();
  TextEditingController textVOLTAJEAgua     = new TextEditingController();
  TextEditingController textPrecioAgua      = new TextEditingController();
  TextEditingController textDistanciaAgua   = new TextEditingController();
  TextEditingController textFrecuenciaAgua  = new TextEditingController();
  TextEditingController textCorrienteAgua   = new TextEditingController();

  File _image;

  String _resistenciaAgua = "Seleccionar";

  SensorProviderAgua(String referencia, String voltaje, String precio,
      String distancia, String frecuencia, String corriente,String resistencia) {
    textReferencia.text = referencia;
    textVOLTAJEAgua.text = voltaje;
    textPrecioAgua.text = precio;
    textDistanciaAgua.text = distancia;
    textFrecuenciaAgua.text = frecuencia;
    textCorrienteAgua.text = corriente;
    _resistenciaAgua = resistencia;
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
