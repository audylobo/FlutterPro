class FishModel {
  final String documentID;
  final Map<String, dynamic> data;

  FishModel({this.documentID, this.data});
}

class DetailFishModel {
  String nombrePez;
  String nombreEspecie;
  String nombreCientifico;
  String continente;
  String img;
  String descripcion;

  Mediciones mediciones;

  EstiloVida estiloVida;

  Detalle detalle;

  DetailFishModel(
      {this.nombrePez = '',
      this.nombreEspecie = '',
      this.nombreCientifico = '',
      this.continente = '',
      this.img = '',
      this.descripcion = '',
      this.mediciones,
      this.estiloVida,
      this.detalle});

  Map<String, dynamic> toMap() {
    return {
      'nombrePez': nombrePez,
      'nombreEspecie': nombreEspecie,
      'nombreCientifico': nombreCientifico,
      'continente': continente,
      'img': img,
      'descripcion': descripcion,
      'mediciones': mediciones.toMap(),
      'estiloVida': estiloVida.toMap(),
      'detalle': detalle.toMap()
    };
  }
}

class Mediciones {
  int tamanoMax;
  int tamanoMin;

  Mediciones({this.tamanoMax = 0, this.tamanoMin = 0});

  Map<String, dynamic> toMap() {
    return {'tamanoMax': tamanoMax, 'tamanoMin': tamanoMin};
  }
}

class EstiloVida {
  int phMax;
  int phMin;
  int tempMax;
  int tempMin;

  EstiloVida(
      {this.phMax = 0, this.phMin = 0, this.tempMax = 0, this.tempMin = 0});

  Map<String, dynamic> toMap() {
    return {
      'phMax': phMax,
      'phMin': phMin,
      'tempMax': tempMax,
      'tempMin': tempMin
    };
  }
}

class Detalle {
  int edadMax;
  int pesoMax;

  Detalle({this.edadMax = 0, this.pesoMax = 0});

  Map<String, dynamic> toMap() {
    return {'edadMax': edadMax, 'pesoMax': pesoMax};
  }
}
