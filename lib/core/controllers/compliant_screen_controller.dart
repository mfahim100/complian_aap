import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled/core/services/database_services.dart';

import 'all_complaints_controller.dart';

class ComplaintScreenController extends GetxController{
  final complaintFormKey = GlobalKey<FormState>();

  final Rx<TextEditingController> _descriptionController = TextEditingController().obs;
  Rx<TextEditingController>  get descriptionController =>  _descriptionController;

final Rx<TextEditingController> _complaintController = TextEditingController().obs;
  Rx<TextEditingController>  get complaintController =>  _complaintController;

final Rx<TextEditingController> _complaintSecretKeyController = TextEditingController().obs;
  Rx<TextEditingController>  get complaintSecretKeyController =>  _complaintSecretKeyController;



  String? descriptionValidator(String? val){

    if(val!.isEmpty ){
      return 'Please Enter Your Department Name';
    }
    return null;

  }


  String? compliantValidator(String? val){

    if(val!.isEmpty ){
      return 'Please Enter Your Department Name';
    }
    return null;
  }


  String? complaintSecretKeyValidator( String? val){

    if(val!.isEmpty ){
      return 'Please Enter Your Department Name';
    }
    return null;
  }


  void clearComplaintController() {
    _descriptionController.value.clear();
    _complaintSecretKeyController.value.clear();
    _complaintController.value.clear();
}

  void addComplaint(BuildContext context) async {

    EasyLoading.show();
    String description = _descriptionController.value.text.trim();
    String complaintSecretKey = _complaintSecretKeyController.value.text.trim();
    String complaint = _complaintController.value.text.trim();


    try {
      EasyLoading.show();
      DatabaseService db = DatabaseService();
      await db.addComplaintData(description, complaint,complaintSecretKey).whenComplete(() {
        Get.find<AllComplaintsController>().getUserAllComplaint();
      });


      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Your Complaint had been uploaded !!!',
            message: 'We will contact you as soon as possible',
            contentType: ContentType.success,
          ),
        ));
      EasyLoading.dismiss();
      clearComplaintController();



    } catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Sorry!!!',
            message: 'Something went wrong',
            contentType: ContentType.failure,
          ),
        ));
      EasyLoading.dismiss();
    }


  }




}



