import 'package:drawer_menu/models/fish_model.dart';
import 'package:drawer_menu/pages/fishes/fishAdd.dart';
import 'package:drawer_menu/pages/fishes/fishDetails.dart';
import 'package:flutter/material.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FishList extends StatefulWidget {
  final FishModel fishData;
  FishList({Key key, this.fishData}) : super(key: key);

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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) =>
                        new FishAdd(fishId: widget.fishData.documentID, isEditing: false,)));
          }),
      body: FutureBuilder(
        future: DatabaseService(null).getFishList(widget.fishData.documentID),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
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
            }

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return fishTile(snapshot.data[index]);
              },
            );
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

  Widget fishTile(Map<String, dynamic> fishData) {
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
                    builder: (context) =>
                        new FishAdd(fishId: widget.fishData.documentID, isEditing: true, fishData: fishData,)));
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
