import 'package:drawer_menu/models/lake_model.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:flutter/material.dart';

class AddLakePage extends StatefulWidget {
  final String lakeId;
  final bool isEditing;
  final Map<String, dynamic> lakeData;


  const AddLakePage({Key key, this.lakeId, this.isEditing = false, this.lakeData})
      : super(key: key);

  @override
  _AddLakePageState createState() => _AddLakePageState();
}

class _AddLakePageState extends State<AddLakePage> {

  LakeModel lakeModel = new LakeModel();

  @override
  void initState() { 
    super.initState();
    if (widget.isEditing) {
      lakeModel = new LakeModel(
        lakeName: widget.lakeData['lakeName'],
        oxigenSendorId: widget.lakeData['oxigen_sendorId'],
        phSensorId: widget.lakeData['ph_sensorId'],
        tempSensorId: widget.lakeData['temp_sensorId'],
        waterLevelSensorId: widget.lakeData['waterLevel_sensorId']
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: widget.isEditing
            ? Text('Editar ${widget.lakeData['lakeName']}')
            : Text('Agregar nuevo lago'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  if (widget.isEditing) {
                    //On editing lake
                    DatabaseService(null)
                      .editLake(widget.lakeId, lakeModel)
                      .then((value) {
                        Navigator.pop(context);
                      })
                      .catchError((error) => print(error));
                  } else {
                    // On new lake
                    DatabaseService(null)
                      .createNewLake(lakeModel)
                      .then((value) {
                        Navigator.pop(context);
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
              TextFormField(
                autofocus: true,
                initialValue: lakeModel.lakeName,
                decoration: InputDecoration(
                  labelText: 'Nombre del lago',
                ),
                onChanged: (value) {
                  setState(() => lakeModel.lakeName = value);
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: Text('- Sensores')),
              TextFormField(
                initialValue: lakeModel.tempSensorId,
                decoration: InputDecoration(
                  labelText: 'ID del sensor de temperatura',
                ),
                onChanged: (value) {
                  setState(() => lakeModel.tempSensorId = value);
                },
              ),
              TextFormField(
                initialValue: lakeModel.oxigenSendorId,
                decoration: InputDecoration(
                  labelText: 'ID del sensor de oxigeno',
                ),
                onChanged: (value) {
                  setState(() => lakeModel.oxigenSendorId = value);
                },
              ),
              TextFormField(
                initialValue: lakeModel.phSensorId,
                decoration: InputDecoration(
                  labelText: 'ID del sensor de ph',
                ),
                onChanged: (value) {
                  setState(() => lakeModel.phSensorId = value);
                },
              ),
              TextFormField(
                initialValue: lakeModel.waterLevelSensorId,
                decoration: InputDecoration(
                  labelText: 'ID del sensor de agua',
                ),
                onChanged: (value) {
                  setState(() => lakeModel.waterLevelSensorId = value);
                },
              )
            ])));
  }
} 
