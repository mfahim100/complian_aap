import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled/core/services/database_services.dart';

import 'all_complaints_controller.dart';

class ComplaintScreenController extends GetxController{
  final complaintFormKey = GlobalKey<FormState>();


  final Rx<TextEditingController> _complaintIdController = TextEditingController().obs;
  Rx<TextEditingController>  get complaintIdController =>  _complaintIdController;

  final Rx<TextEditingController> _complaintTitleController = TextEditingController().obs;
  Rx<TextEditingController>  get complaintTitleController =>  _complaintTitleController;

final Rx<TextEditingController> _complaintController = TextEditingController().obs;
  Rx<TextEditingController>  get complaintController =>  _complaintController;


  String? complaintIDValidator(String? val){

    if(val!.isEmpty ){
      return 'Please Enter Your Complaint ID';
    }
    return null;
  }



  String? complaintTitleValidator(String? val){

    if(val!.isEmpty ){
      return 'Please Enter Your Complaint title';
    }
    return null;

  }


  String? complaintValidator( String? val){

    if(val!.isEmpty ){
      return 'Please Enter Your Complaint';
    }
    return null;
  }


  void clearComplaintController() {
    _complaintIdController.value.clear();
    _complaintTitleController.value.clear();
    _complaintController.value.clear();
}

  void addComplaint(BuildContext context) async {

    EasyLoading.show();
    String compliantID = _complaintIdController.value.text.trim();
    String complaintTitle = _complaintTitleController.value.text.trim();
    String complaint = _complaintController.value.text.trim();


    try {
      EasyLoading.show();
      DatabaseService db = DatabaseService();
      await db.addComplaintData(compliantID,complaintTitle,complaint).whenComplete(() {
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



