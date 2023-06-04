


import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled/ui/screens/home/home_screen.dart';

import '../services/database_services.dart';

class SignUpController extends GetxController{


  final signUpKey = GlobalKey<FormState>();

  final Rx<TextEditingController> _nameController = TextEditingController().obs;
  Rx<TextEditingController>  get nameController =>  _nameController;

 final Rx<TextEditingController> _mobileController = TextEditingController().obs;
  Rx<TextEditingController>  get mobileController =>  _mobileController;

 final Rx<TextEditingController> _emailController = TextEditingController().obs;
  Rx<TextEditingController>  get emailController =>  _emailController;

  final Rx<TextEditingController> _departmentController = TextEditingController().obs;
  Rx<TextEditingController>  get departmentController =>  _departmentController;

  final Rx<TextEditingController> _samesterController = TextEditingController().obs;
  Rx<TextEditingController>  get samesterController =>  _samesterController;

  final Rx<TextEditingController> _registrationNumberController = TextEditingController().obs;
  Rx<TextEditingController>  get registrationNumberController =>  _registrationNumberController;


  final Rx<TextEditingController> _passwordController = TextEditingController().obs;
  Rx<TextEditingController>  get passwordController =>  _passwordController;

  final Rx<TextEditingController> _confirmPasswordController = TextEditingController().obs;
  Rx<TextEditingController>  get confirmPasswordController =>  _confirmPasswordController;


///////////// SignUpPageValidators /////


  String? nameValidator(String? value){

    if(value!.isEmpty){
      return 'Please fill the Name';
    }
    return null;
  }


  String? mobileValidator(String? value){

    if(value!.isEmpty){
      return 'Please fill the Mobile Number';
    }
    return null;
  }


  String? emailValidator(String? value){

    if(value!.isEmpty){
      return 'Please fill the email';
    }
    return null;
  }


  String? departmentValidator(String? val){

    if(val!.isEmpty ){
      return 'Please Enter Your Department Name';
    }
    return null;

  }

  String? samesterValidator(String? val){

    if(val!.isEmpty ){
      return 'Please Enter Your Samester';
    }
    return null;

  }

  String? registrationNumberValidator(String? val){

    if(val!.isEmpty ){
      return 'Please Enter Your Registration Number';
    }
    return null;

  }




  String? passwordValidator(String? value){

    if(value!.isEmpty){
      return 'Please fill the Password';
    }
    if(value.length < 8){
      return 'Password must be at least eight characters';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value){

    if(value!= _passwordController.value.text){
      return 'Password does not match';
    }
    return null;
  }


  void clearController(){
    _nameController.value.clear();
    _mobileController.value.clear();
    _emailController.value.clear();
    _passwordController.value.clear();
    _confirmPasswordController.value.clear();
    _departmentController.value.clear();
    _samesterController.value.clear();
    _registrationNumberController.value.clear();
  }

  Future<void> signUp(BuildContext context) async {
    String email = _emailController.value.text.trim();
    String password = _passwordController.value.text.trim();
    String mobileNumber = _mobileController.value.text.trim();
    String name = _nameController.value.text.trim();
    String department = _departmentController.value.text.trim();
    String samester = _samesterController.value.text.trim();
    String registrationNumber = _registrationNumberController.value.text.trim();


    try{
      EasyLoading.show();
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if(user.user!=null){
        DatabaseService db = DatabaseService();
        db.insertUserData(name, mobileNumber,department,samester,registrationNumber);

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder){
          return const MyHomePage();
        }));

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Congratulation',
              message: 'Your Account has been Created',
              contentType: ContentType.success,
            ),
          ));
      }

      clearController();

    }
    on FirebaseAuthException catch(e){
      if(e.code=='email-already-in-use'){
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Sorry!!!',
              message: 'Email Already in use',
              contentType: ContentType.failure,
            ),
          ));

      }
      else if(e.code=='weak-password'){
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Sorry!!!',
              message: 'Password is weak',
              contentType: ContentType.failure,
            ),
          ));
      }

    }
    catch(e){
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
      print('Something gone fucked');
      print(e);



    }

    EasyLoading.dismiss();

  }



}