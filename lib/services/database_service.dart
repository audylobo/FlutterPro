import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawer_menu/models/fish_model.dart';
import 'package:drawer_menu/models/lake_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  // Instance with user id
  final String uid;
  DatabaseService(this.uid);

  // Collections reference
  final CollectionReference userDataCollection =
      Firestore.instance.collection('users');
  final CollectionReference fishDataCollection =
      Firestore.instance.collection('fish');
  final CollectionReference lakeDataCollection =
      Firestore.instance.collection('lakes');
  final CollectionReference sensorDataCollection =
      Firestore.instance.collection('sensors');
  final CollectionReference reportDataCollection =
      Firestore.instance.collection('reports');

  //User
  Future updateUserData(
      String rol, String phone, String email, String token) async {
    await userDataCollection.document(uid).setData({
      'rol': rol,
      'phone': phone,
      'registration_date': DateTime.now(),
      'email': email,
      'token': token
    });
  }

  Future<DocumentSnapshot> getUserData() async {
    return await userDataCollection.document(uid).get();
  }

  // Fish stream
  Stream<List<FishModel>> get fishStream {
    return fishDataCollection.snapshots().map((snapshot) => snapshot.documents
        .map((doc) => FishModel(documentID: doc.documentID, data: doc.data))
        .toList());
  }

  // Get fish list by categories
  Future<List<DocumentSnapshot>> getFishList(String category) {
    return fishDataCollection
        .document(category)
        .collection('Content')
        .getDocuments()
        .then((snapshot) => snapshot.documents);
  }

  // Create new fish in selected category
  Future createNewFish(String category, DetallePez fishData) {
    return fishDataCollection
        .document(category)
        .collection('Content')
        .document()
        .setData(fishData.toMap());
  }

  // Edit existent fish in selected category
  Future editFish(
      String category, String fishDocumentId, DetallePez fishData) {
    return fishDataCollection
        .document(category)
        .collection('Content')
        .document(fishDocumentId)
        .setData(fishData.toMap());
  }

  // Delete fish by category and document id
  Future deleteFish(String category, String fishDocumentId) {
    return fishDataCollection
        .document(category)
        .collection('Content')
        .document(fishDocumentId)
        .delete();
  }

  // load all fish data
  Future<List<Map<String, dynamic>>> loadAllFishes() async {
    List<Map<String, dynamic>> allFishesCollection = [];
    var fishCategories = await fishDataCollection
        .getDocuments()
        .then((category) => category.documents)
        .catchError((error) => print(error));

    var fishes = fishCategories.map((docs) => docs.documentID);

    for (var documentId in fishes) {
      await fishDataCollection
          .document(documentId)
          .collection('Content')
          .getDocuments()
          .then((fishDocuments) => fishDocuments.documents.forEach((fish) {
                allFishesCollection.add(fish.data);
              }));
    }

    return allFishesCollection;
  }

  // upload file image to firebase storage
  Future<String> uploadImage(File file, String fileName) async {
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

  /* 
  
        LAKES
  
  */

  Future<List<DocumentSnapshot>> getLakeList() {
    return lakeDataCollection
        .getDocuments()
        .then((snapshot) => snapshot.documents);
  }

  Future createNewLake(LakeModel lakeData) {
    return lakeDataCollection.document().setData(lakeData.toMap(), merge: true);
  }

  Future editLake(String lakeDocumentId, LakeModel lakeData) {
    return lakeDataCollection
        .document(lakeDocumentId)
        .setData(lakeData.toMap());
  }

  Future deleteLake(String lakeDocumentId) {
    return lakeDataCollection.document(lakeDocumentId).delete();
  }

  /*

    REPORTS

  */

  Future<List<DocumentSnapshot>> getReportList() {
    return reportDataCollection
        .orderBy('createdDate', descending: true)
        .getDocuments()
        .then((snapshot) => snapshot.documents);
  }

  Future createNewReport(String userName) async {
    // Get all sensor data
    var sensors = await sensorDataCollection
        .getDocuments()
        .then((snapshot) => snapshot.documents);

    var sensorData = sensors.map((test) => test.data).toList();

    return reportDataCollection.document().setData({
      'createdBy': userName,
      'createdDate': DateTime.now(),
      'sensors': sensorData
    });
  }

  /*

    SENSORS

  */

}
