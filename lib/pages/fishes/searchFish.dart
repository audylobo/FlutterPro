import 'package:drawer_menu/pages/fishes/fishDetails.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SearchBarController<Map<String,dynamic>> _searchBarController = SearchBarController();
  bool isReplay = false;

  Future<List<Map<String,dynamic>>> _filteredFishes(String text) async {
    List<Map<String,dynamic>> posts = await DatabaseService(null)
        .loadAllFishes()
        .then((value) => value.map((fish) => fish).toList());

    var result = posts.where((fish) => fish['nombreEspecie'].toString().toLowerCase().contains(text.toLowerCase()) || fish['nombrePez'].toString().toLowerCase().contains(text.toLowerCase())).toList();
    
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar pez'),
      ),
      body: SafeArea(
        child: SearchBar<Map<String,dynamic>>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          hintText: 'Buscar pez por nombre',
          onSearch: _filteredFishes,
          searchBarController: _searchBarController,
          cancellationWidget: Text("Cancelar"),
          emptyWidget: Center(child: Text("No se encontraron resultados ...")),
          onCancelled: () {
            print("Cancelled triggered");
          },
          mainAxisSpacing: 1,
          onItemFound: (Map<String,dynamic> fishData, int index) {
            return Card(
              child: ListTile(
                leading: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/fish-loading.gif',
                  image: fishData['img'],
                  width: 100.0,
                ),
                title: Text(
                    '${fishData['nombreEspecie']} ${fishData['nombrePez']}'),
                subtitle: Text(fishData['nombreCientifico']),
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
          },
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text("Detail"),
          ],
        ),
      ),
    );
  }
}
