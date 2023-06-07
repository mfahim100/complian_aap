import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/core/models/user_model.dart';
import 'package:untitled/core/services/database_services.dart';

import '../services/storage_services.dart';

class ProfileController extends GetxController {


  final Rx<TextEditingController>  _newPasswordController = TextEditingController().obs;
  TextEditingController get newPasswordController => _newPasswordController.value;

final Rx<TextEditingController>  _confirmPasswordController = TextEditingController().obs;
  TextEditingController get confirmPasswordController => _confirmPasswordController.value;



var passwordFormKey = GlobalKey<FormState>();

  String? newPasswordValidator(String? val) {
    if (val == null) {
      return 'Please fill the New Password';
    }
    if (val.length < 8) {
      return 'Password Must be at least eight characters';
    }
    return null;
  }

  String? confirmPasswordValidator(String? val) {
    if (val != newPasswordController.text) {
      return 'Password does not matches';
    }

    return null;
  }

  void clearPasswordController() {
    _newPasswordController.value.clear();
    _confirmPasswordController.value.clear();
  }

  void changePassword() {
    String newPassword = newPasswordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    try {
      final user = FirebaseAuth.instance.currentUser;

      user!.updatePassword(newPassword);
      clearPasswordController();
      FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Some thing went wrong');
    }
  }



  DatabaseService db=DatabaseService();
  UserModel? user;

  RxBool isLoading = true.obs;

  Future<void> getUser() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    user = await db.getUser(uid);
    isLoading.value=true;
    isLoading.value=false;

  }




  String? filePath;
  Uint8List? imageFile;
  File? file;

  getPicture(BuildContext context,ImageSource source) async {
    EasyLoading.show();
    final picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: source,
    );
    if (pickedImage != null) {
      filePath = pickedImage.path;

      file = File(pickedImage.path);
      imageFile = await pickedImage.readAsBytes();
     await uploadImage().whenComplete(() => Navigator.of(context).pop());
    } else {}
    EasyLoading.dismiss();
  }

  ///
  /// ////get image from camera and send to API
  //////////


  Future<void> uploadImage() async {
    StorageServices services = StorageServices();
    await services.uploadProfilePhoto(file!, user!);
    await getUser();
  }


}