import 'package:drawer_menu/models/fish_model.dart';
import 'package:drawer_menu/pages/fishes/fishList.dart';
import 'package:drawer_menu/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Fishp extends StatelessWidget {
static const String routeName = "/pezhome";
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<FishModel>>.value(
      initialData: null,
      value: DatabaseService(null).fishStream,
      child: Scaffold(        
        body: FishCategories(),
      ),      
    );
  }
}

class FishCategories extends StatefulWidget {
  FishCategories({Key key}) : super(key: key);

  @override
  _FishCategoriesState createState() => _FishCategoriesState();
}

class _FishCategoriesState extends State<FishCategories> {
  @override
  Widget build(BuildContext context) {

    //Get fish stream context
    final categories = Provider.of<List<FishModel>>(context);

    return ListView.builder(
      itemCount: categories != null ? categories.length : 0,      
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: FadeInImage.assetNetwork(
            placeholder: 'assets/images/fish-loading.gif', image: categories[index].data['img'], width: 100.0,),
            title: Text(categories[index].documentID),
            subtitle: Text(categories[index].data['description']),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
            isThreeLine: true,
            onTap: () {
              // Go to de fish selection page
              Navigator.push(
                context,
              new MaterialPageRoute(builder: (context) => new FishList(fishData: categories[index])));
            },
          ),
        );
      },
    );
  }
}
