import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/fish_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService{

  // Instance with user id
  final String uid;
  DatabaseService(this.uid);

  // Collections reference
  final CollectionReference userDataCollection = Firestore.instance.collection('users');
  final CollectionReference fishDataCollection = Firestore.instance.collection('fish');

  //User

  Future updateUserData(String rol, String phone, String email) async{
    await userDataCollection.document(uid).setData({
      'rol' : rol,
      'phone' : phone,
      'registration_date' : DateTime.now(),
      'email' : email
    });
  }

  Future<DocumentSnapshot> getUserData() async {
    return await userDataCollection.document(uid).get();
  }

  // Fish stream
  Stream<List<FishModel>> get fishStream {
    return fishDataCollection.snapshots()
      .map((snapshot) => snapshot.documents.map((doc) => FishModel(documentID: doc.documentID, data: doc.data)).toList());
  }

  Future<List> getFishList(String category) {
    return fishDataCollection.document(category).collection('Content').getDocuments()
      .then((snapshot) => snapshot.documents.map((doc) => doc.data).toList());
  }

  Future createNewFish(String category, DetailFishModel fishData) {
    print(fishData.toMap());
    return fishDataCollection.document(category).collection('Content').document().setData(fishData.toMap());
  }

  Future<String> uploadImage(File file, String fileName) async{
    // Create storage reference
    StorageReference storageReference;
    storageReference = FirebaseStorage.instance.ref().child(fileName);

    // Upload file
    final StorageUploadTask uploadTask = storageReference.putFile(file);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);

    // Get file storage url
    final String url = (await downloadUrl.ref.getDownloadURL());
    return url;
  }

}