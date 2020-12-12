import 'dart:io';

import 'package:flutter/material.dart' show TextEditingController;

class SensorTemperaturaProvider {
  TextEditingController textReferencia                 = new TextEditingController();
  TextEditingController textCONSUMOTemperatura = new TextEditingController();
  TextEditingController textPRECIOTemperatura = new TextEditingController();
  TextEditingController textTEMPERATURATOLERABLE = new TextEditingController();

  File _image;

  String _resistenciaAgua = "Seleccionar";

  SensorTemperaturaProvider(
    String referencia,
    String consumo,
    String temperatura,
    String precio,
    String resistenciaAgua,
  ) {
    textReferencia.text = referencia;
    textCONSUMOTemperatura.text = consumo;
    textPRECIOTemperatura.text = precio;
    textTEMPERATURATOLERABLE.text = temperatura;
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
