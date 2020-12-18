import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/user_model.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:drawer_menu/src/pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Reportes'),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: RaisedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: isLoading
                      ? <Widget>[
                          SpinKitCircle(size: 30.0, color: Colors.white),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Creando reporte ...',
                            style: TextStyle(color: Colors.white),
                          ),
                        ]
                      : <Widget>[
                          Icon(
                            Icons.insert_chart,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Generar nuevo reporte',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                ),
                color: Colors.blue,
                onPressed: () {
                  if (!isLoading) {
                    isLoading = true;
                    DatabaseService(null)
                        .createNewReport(user.name)
                        .then((value) {
                          isLoading = false;
                          (context as Element).reassemble();
                    });
                  }
                }),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              child: Container(
                width: double.infinity,
                height: 50.0,
                color: Colors.white,
                child: FutureBuilder(
                  future: DatabaseService(null).getReportList(),
                  initialData: List<DocumentSnapshot>(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: SpinKitCircle(
                        color: Colors.blue,
                      ));
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return reportItem(snapshot.data[index]);
                        },
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.insert_chart,
                            color: Colors.blue,
                          ),
                          Text('No se encontraron reportes generados'),
                        ],
                      );
                    }
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
