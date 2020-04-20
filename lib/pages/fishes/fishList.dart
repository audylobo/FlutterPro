import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/fish_model.dart';
import 'package:drawer_menu/pages/fishes/fishAdd.dart';
import 'package:drawer_menu/pages/fishes/fishDetails.dart';
import 'package:flutter/material.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FishList extends StatefulWidget {
  final FishModel fishData;
  final String userRol;
  FishList({Key key, this.fishData, this.userRol}) : super(key: key);

  @override
  _FishListState createState() => _FishListState();
}

class _FishListState extends State<FishList> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: new AppBar(
        title: Text(widget.fishData.documentID),
      ),
      floatingActionButton: widget.userRol == 'admin' ? FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new FishAdd(
                          fishCategory: widget.fishData.documentID,
                          isEditing: false,
                        )));
          }) : null,
      body: FutureBuilder(
        future: DatabaseService(null).getFishList(widget.fishData.documentID),
        initialData: new List<DocumentSnapshot>(),
        builder: (BuildContext context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length == 0) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'assets/images/fish-loading.gif',
                      width: 100.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('No se encontraron resultados')
                ],
              ));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return fishTile(snapshot.data[index].data, snapshot.data[index].documentID);
                },
              );
            }
          } else {
            return Center(
                child: SpinKitCircle(
              color: Colors.blue,
            ));
          }
        },
      ),
    );
  }

  Widget fishTile(Map<String, dynamic> fishData, String documentId) {
    final GlobalKey _menuKey = new GlobalKey();

    final menuButton = new PopupMenuButton(
        key: _menuKey,
        itemBuilder: (_) => <PopupMenuItem<String>>[
              new PopupMenuItem<String>(
                  child: const Text('Editar'), value: 'edit'),
              new PopupMenuItem<String>(
                  child: const Text('Eliminar'), value: 'delete'),
            ],
        onSelected: (value) {
          switch (value) {
            case 'edit':
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new FishAdd(
                            fishCategory: widget.fishData.documentID,
                            isEditing: true,
                            fishData: fishData,
                            documentId: documentId,
                          )));
              break;
            case 'delete':
              DatabaseService(null)
                  .deleteFish(widget.fishData.documentID, documentId)
                  .then((value) {
                    print(documentId + ' Deleted');
                    (context as Element).reassemble();
                  });
              break;
            default:
          }
        });

    return Card(
      child: ListTile(
        leading: FadeInImage.assetNetwork(
          placeholder: 'assets/images/fish-loading.gif',
          image: fishData['img'],
          width: 100.0,
        ),
        title: Text('${fishData['nombreEspecie']} ${fishData['nombrePez']}'),
        subtitle: Text(fishData['nombreCientifico']),
        trailing: menuButton,
        isThreeLine: true,
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) =>
                      new FishDetails(fishDetails: fishData)));
        },
      ),
    );
  }
}
