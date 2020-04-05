import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  // Instance with user id
  final String uid;
  DatabaseService(this.uid);

  // Collections reference
  final CollectionReference userDataCollection = Firestore.instance.collection('users');
  final CollectionReference fishDataCollection = Firestore.instance.collection('fish');

  Future updateUserData(String rol, String phone) async{
    await userDataCollection.document(uid).setData({
      'rol' : rol,
      'phone' : phone,
      'registration_date' : DateTime.now()
    });
  }

  Future<DocumentSnapshot> getUserData() async {
    return await userDataCollection.document(uid).get();
  }
}