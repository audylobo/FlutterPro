import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class GetPhoto {

  Future<File> openGallery(BuildContext context) async {

    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
  
    return picture;
  }

  Future<File> openCamera(BuildContext context) async {

    var picture = await ImagePicker.pickImage(source: ImageSource.camera);

    return picture;
  }

  Future<File> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a Choice"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () async {
                      var picture = await openGallery(context);
                      Navigator.of(context).pop(picture);
                    
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () async  {
                      var picture = await  openCamera(context);
                      Navigator.of(context).pop(picture);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }


  Future<String> getUrlImage(File imgFile) async {

    var timeKey = DateTime.now();

    final StorageReference perfilImage =  FirebaseStorage.instance.ref().child("sensores");

    final StorageUploadTask uploadTask =
        perfilImage.child(timeKey.toString() + ".jpg").putFile(imgFile);
    var imageUrl = await (await uploadTask.onComplete)
        .ref
        .getDownloadURL(); // ESE NOMBRE LO MANTENDREMOS ALEOJADO EN ALGUN CAMPO DE LA BD
    //AGREGAR ESE REGISTRO A LA TABLA DE USUARIOS
    String url = imageUrl.toString();
    return url;
  }

}
