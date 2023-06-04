import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/user_model.dart';
import 'database_services.dart';

class StorageServices{

  Future<String> uploadProfilePhoto(File image,UserModel model) async {
    String url = '';
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference =
    FirebaseStorage.instance.ref().child("profiles").child(model.uid!);
    await reference.putFile(image);
    print('@@@@@@@@@@ $image');
    url = await reference.getDownloadURL();

    UserModel? mdl=model.copyWith(imgUrl: url);
    DatabaseService db =DatabaseService();
    await db.updateProfile(mdl!);
    print('@@@@@@@@@@ $url');
    return url;

  }



  }

