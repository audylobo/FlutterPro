import 'package:drawer_menu/models/fish_model.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class FishAdd extends StatefulWidget {
  final String fishCategory;
  final bool isEditing;
  final Map<String, dynamic> fishData;
  final String documentId;
  FishAdd(
      {Key key,
      this.fishCategory,
      this.isEditing,
      this.fishData,
      this.documentId})
      : super(key: key);

  @override
  _FishAddState createState() => _FishAddState();
}

class _FishAddState extends State<FishAdd> {
  DetallePez fishModel = new DetallePez(
      detalle: new Detalle(),
      estiloVida: new EstiloVida(),
      mediciones: new Mediciones());

  String status = 'Subir imagen';

  Future getImage() async {
    setState(() {
      status = 'Cargando...';
    });

    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    String fileName = '${fishModel.nombreEspecie}-${p.basename(image.path)}';

    DatabaseService(null).uploadImage(image, fileName).then((value) {
      setState(() {
        fishModel.img = value;
        status = 'Subir imagen';
      });
    });
  }

  @override
  void initState() { 
    super.initState();
    if (widget.isEditing) {
      setState(() {
        fishModel = new DetallePez(
            continente: widget.fishData['continente'],
            descripcion: widget.fishData['descripcion'],
            nombrePez: widget.fishData['nombrePez'],
            nombreCientifico: widget.fishData['nombreCientifico'],
            nombreEspecie: widget.fishCategory,
            img: widget.fishData['img'],
            detalle: new Detalle(
                pesoMax: widget.fishData['detalle']['pesoMax'],
                edadMax: widget.fishData['detalle']['edadMax']),
            estiloVida: new EstiloVida(
                phMax: widget.fishData['estiloVida']['phMax'],
                phMin: widget.fishData['estiloVida']['phMin'],
                tempMax: widget.fishData['estiloVida']['tempMax'],
                tempMin: widget.fishData['estiloVida']['tempMin']),
            mediciones: new Mediciones(
                tamanoMax: widget.fishData['mediciones']['tamanoMax'],
                tamanoMin: widget.fishData['mediciones']['tamanoMin']));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      fishModel.nombreEspecie = widget.fishCategory;
    });

    
    return Scaffold(
      appBar: AppBar(
        title: widget.isEditing
            ? Text('Editar ${widget.fishCategory} ${widget.fishData['nombrePez']}')
            : Text('Agregar nuevo ' + widget.fishCategory),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (widget.isEditing) {
                  //On editing fish
                  DatabaseService(null)
                      .editFish(
                          widget.fishCategory, widget.documentId, fishModel)
                      .then((onValue) {
                    Navigator.pop(context);
                  }).catchError((error) => print(error));
                } else {
                  // On new fish
                  DatabaseService(null)
                      .createNewFish(widget.fishCategory, fishModel)
                      .then((onValue) {
                    Navigator.pop(context);
                  }).catchError((error) {
                    print(error);
                  });
                }
              }),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
          children: <Widget>[
            Text(' - Información general'),
            TextFormField(
              autofocus: true,
              initialValue: widget.isEditing ? widget.fishData['nombrePez'] : fishModel.nombrePez,
              decoration: InputDecoration(
                labelText: 'Nombre del pez',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.nombrePez = value;
                });
              },
            ),
            TextFormField(
              initialValue: fishModel.nombreCientifico,
              decoration: InputDecoration(
                labelText: 'Nombre cientifico',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.nombreCientifico = value;
                });
              },
            ),
            TextFormField(
              initialValue: fishModel.continente,
              decoration: InputDecoration(
                labelText: 'Continente',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.continente = value;
                });
              },
            ),
            TextFormField(
              initialValue: fishModel.descripcion,
              decoration: InputDecoration(
                labelText: 'Descripción',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.descripcion = value;
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(children: [
              Expanded(
                  flex: 1,
                  child: fishModel.img.length > 0
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(fishModel.img))
                      : Text('No se encontro una imagen')),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(status),
                onPressed: getImage,
              ))
            ]),
            TextFormField(
              controller: TextEditingController()..text = fishModel.img,
              onChanged: (value) {
                setState(() {
                  fishModel.img = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Imagen url',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(' - Detalle'),
            ),
            TextFormField(
              initialValue: fishModel.detalle.edadMax.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Edad maxima (Años)',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.detalle.edadMax = int.parse(value);
                });
              },
            ),
            TextFormField(
              initialValue: fishModel.detalle.pesoMax.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso maximo (Gramos)',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.detalle.pesoMax = int.parse(value);
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(' - Estilo de vida'),
            ),
            TextFormField(
              initialValue: fishModel.estiloVida.phMax.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'PH Maximo',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.estiloVida.phMax = int.parse(value);
                });
              },
            ),
            TextFormField(
              initialValue: fishModel.estiloVida.phMin.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'PH Minimo',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.estiloVida.phMin = int.parse(value);
                });
              },
            ),
            TextFormField(
              initialValue: fishModel.estiloVida.tempMax.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Temperatura Maxima (° C)',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.estiloVida.tempMax = int.parse(value);
                });
              },
            ),
            TextFormField(
              initialValue: fishModel.estiloVida.tempMin.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Temperatura Minima (° C)',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.estiloVida.tempMin = int.parse(value);
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(' - Mediciones'),
            ),
            TextFormField(
              initialValue: fishModel.mediciones.tamanoMax.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tamaño Maximo (cm)',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.mediciones.tamanoMax = int.parse(value);
                });
              },
            ),
            TextFormField(
              initialValue: fishModel.mediciones.tamanoMin.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tamaño Minimo (cm)',
              ),
              onChanged: (value) {
                setState(() {
                  fishModel.mediciones.tamanoMin = int.parse(value);
                });
              },
            ),
            SizedBox(
              height: 30.0,
            )
          ],
        ),
      ),
    );
  }
}
