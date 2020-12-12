import 'dart:io';

import 'package:flutter/material.dart' show TextEditingController;

class SensorPHProvider {

  TextEditingController textReferencia             = new TextEditingController();
  TextEditingController textVOLTAJEPH              = new TextEditingController();
  TextEditingController textMEDICIONPH             = new TextEditingController();
  TextEditingController textTemperaturaTolerablePH =  new TextEditingController();
  TextEditingController textPrecisionPH            = new TextEditingController();
  TextEditingController textTiempoRespuestaPH      = new TextEditingController();

  File _image;

  String _resistenciaAgua = "Seleccionar";

  SensorPHProvider(String referencia,String voltaje, String medicion, String temperatura,String precision, String tiemporespuesta, String resistenciaAgua) {

    textReferencia.text = referencia;
    textVOLTAJEPH.text = voltaje;
    textMEDICIONPH.text = medicion;
    textTemperaturaTolerablePH.text = temperatura;
    textPrecisionPH.text = precision;
    textTiempoRespuestaPH.text = tiemporespuesta;
    _resistenciaAgua = resistenciaAgua;

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
