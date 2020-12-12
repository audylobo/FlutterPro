import 'dart:io';


import 'package:flutter/cupertino.dart';

class CreateProviderSensor with ChangeNotifier {


  File _image;
  String _tipoSensor      = "Seleccionar";
  String _resistenciaAgua = "Seleccionar";



   TextEditingController textReferencia                 = new TextEditingController();

  // SENSOR DE TEMPERATURA
  TextEditingController textCONSUMOTemperatura          = new TextEditingController();
  TextEditingController textPRECIOTemperatura           = new TextEditingController();
  TextEditingController textTEMPERATURATOLERABLE        = new TextEditingController();
  
  //sensor de voltaje
  TextEditingController textVOLTAJE                     = new TextEditingController();
  TextEditingController textPrecioVoltaje               = new TextEditingController();
  TextEditingController textRangoDeteccionVoltaje       = new TextEditingController();
  TextEditingController textRangoPrecisionVoltaje       = new TextEditingController();

  //	SENSOR DE PH

  TextEditingController textVOLTAJEPH                 = new TextEditingController();
  TextEditingController textMEDICIONPH                = new TextEditingController();
  TextEditingController textTemperaturaTolerablePH    = new TextEditingController();
  TextEditingController textPrecisionPH               = new TextEditingController();
  TextEditingController textTiempoRespuestaPH         = new TextEditingController();

  //AGUA
  TextEditingController textVOLTAJEAgua              = new TextEditingController();
  TextEditingController textPrecioAgua               = new TextEditingController();
  TextEditingController textDistanciaAgua            =  new TextEditingController();
  TextEditingController textFrecuenciaAgua           = new TextEditingController();
  TextEditingController textCorrienteAgua            = new TextEditingController();



  get image {
    return _image;
  }

  set setImage(File dato) {
    this._image = dato;
    notifyListeners();
  }

  get tipoSensor {
    return _tipoSensor;
  }

  set setTipoSensor(String dato) {
    this._tipoSensor = dato;
   notifyListeners(); 
  }

    get resistenciaAgua {
    return _resistenciaAgua;
  }

  set setResistencia(String dato) {
    this._resistenciaAgua = dato;
     notifyListeners(); 
  }

  void clearText(){

    textReferencia               .clear();
    textCONSUMOTemperatura       .clear();
    textPRECIOTemperatura        .clear();
    textTEMPERATURATOLERABLE     .clear();
    textVOLTAJE                  .clear();
    textPrecioVoltaje            .clear();
    textRangoDeteccionVoltaje    .clear();
    textRangoPrecisionVoltaje    .clear();
    textVOLTAJEPH                .clear();
    textMEDICIONPH               .clear();
    textTemperaturaTolerablePH   .clear();
    textPrecisionPH              .clear();
    textTiempoRespuestaPH        .clear();
    textVOLTAJEAgua              .clear();
    textPrecioAgua               .clear();
    textDistanciaAgua            .clear();
    textFrecuenciaAgua           .clear();
    textCorrienteAgua            .clear();
    this.setImage= null;
    this.setTipoSensor  = "Seleccionar";
    this.setResistencia = "Seleccionar";
    


  }
}
