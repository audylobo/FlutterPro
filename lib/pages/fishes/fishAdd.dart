import 'dart:io';

import 'package:drawer_menu/models/fish_model.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class FishAdd extends StatefulWidget {
  final String fishId;
  final bool isEditing;
  final Map<String, dynamic> fishData;
  FishAdd({Key key, this.fishId, this.isEditing, this.fishData}) : super(key: key);

  @override
  _FishAddState createState() => _FishAddState();
}

class _FishAddState extends State<FishAdd> {
  DetailFishModel fishModel = new DetailFishModel(
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
  Widget build(BuildContext context) {
    fishModel.nombreEspecie = widget.fishId;

    return Scaffold(
      appBar: AppBar(
        title: widget.isEditing ? Text('Editar ' + widget.fishData['nombrePez']): Text('Agregar nuevo ' + widget.fishId),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                DatabaseService(null)
                    .createNewFish(widget.fishId, fishModel)
                    .then((onValue) {
                  Navigator.pop(context);
                }).catchError((error) {
                  print(error);
                });
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
              initialValue: fishModel.nombrePez,
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
            Row(children: [
              Expanded(
                flex: 3,
                child: TextFormField(
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
              ),
              SizedBox(
                width: 30.0,
              ),
              Expanded(
                  child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(status),
                onPressed: getImage,
              ))
            ]),
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
