import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  // Collection reference
  final CollectionReference entitiesCollection = Firestore.instance.collection('entities');
  final CollectionReference userDataCollection = Firestore.instance.collection('userdata');
  final CollectionReference newsCollection = Firestore.instance.collection('news');

  Future updateUserData(String name) async{

    return await userDataCollection.document(uid).setData({
      'name' : name,
      'registration_date' : DateTime.now()
    });
  }

  Future getUserData(String uid) async {

    //return await userDataCollection.document(uid).('name');

  }


  //Entities

  Future createNewEntity(){


  }

  Future updateEntity(){

  }



}