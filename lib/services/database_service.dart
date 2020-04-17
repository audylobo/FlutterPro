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

  // Get fish list by categories
  Future<List<DocumentSnapshot>> getFishList(String category) {
    return fishDataCollection.document(category).collection('Content').getDocuments()
      .then((snapshot) => snapshot.documents);
  }

  // Create new fish in selected category
  Future createNewFish(String category, DetailFishModel fishData) {
    return fishDataCollection.document(category).collection('Content').document().setData(fishData.toMap());
  }

  // Edit existent fish in selected category
  Future editFish(String category, String fishDocumentId, DetailFishModel fishData) {
    return fishDataCollection.document(category).collection('Content').document(fishDocumentId).setData(fishData.toMap());
  }

  // Delete fish by category and document id
  Future deleteFish(String category, String fishDocumentId) {
    return fishDataCollection.document(category).collection('Content').document(fishDocumentId).delete();
  }

  // Filter fish data


  // upload file image to firebase storage
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