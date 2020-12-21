import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/mysuperlago.dart';
import 'package:drawer_menu/models/reporte.dart';
import 'package:drawer_menu/models/user_model.dart';
import 'package:drawer_menu/services/streams/stream_sensor_temperatura.dart';
import 'package:drawer_menu/src/misuper_pdf.dart';
import 'package:drawer_menu/src/pdf.dart';
import 'package:drawer_menu/services/database_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final myFuture = new StreamSensorTemperatura();

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Reportes'),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              child: Container(
                width: double.infinity,
                height: 50.0,
                color: Colors.white,
                child: FutureBuilder<List<Reporte>>(
                  future: myFuture.getReportes(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Reporte>> snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<Reporte> arrayList = snapshot.data;

                    return ListView.builder(
                      itemCount: arrayList.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return ListTile(
                          leading: Icon(Icons.picture_as_pdf),
                          title: Text(arrayList[index].email),
                          trailing: Icon(Icons.perm_device_info),
                          onTap: () async {
                            var query = await Firestore.instance
                                .collection('lagos')
                                .document(arrayList[index].idLago)
                                .get();

                            final lago = MySuperLago.fromDocument(query.data);

                            generateDocument(lago);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget reportItem(DocumentSnapshot data) {
    var formatter = new DateFormat('yyyy-MM-dd HH:mm');

    return Column(children: <Widget>[
      ListTile(
        leading: Icon(Icons.insert_chart),
        title:
            Text('Reporte : ${formatter.format(data['createdDate'].toDate())}'),
        subtitle: Text('Generado por: ${data['createdBy']}'),
        trailing: IconButton(
            icon: Icon(
              Icons.file_download,
              color: Colors.blue,
            ),
            onPressed: () {
              //createReportPDF(data);
            }),
      ),
      Divider()
    ]);
  }
}
