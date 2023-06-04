


import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../ui/screens/home/home_screen.dart';

class SignInController extends GetxController{

  final signInKey = GlobalKey<FormState>();


  final Rx<TextEditingController> _emailController = TextEditingController().obs;
  Rx<TextEditingController>  get emailController =>  _emailController;

  final Rx<TextEditingController> _passwordController = TextEditingController().obs;
  Rx<TextEditingController>  get passwordController =>  _passwordController;



  void clearSignInPageController(){
    _emailController.value.clear();
    _passwordController.value.clear();
  }


  String? emailValidator(String? val){

    if(val!.isEmpty ){
      return 'Please Enter Your Email';
    }
    return null;

  }



  String? passwordValidator(String? val){

    if(val!.isEmpty ){
      return 'Please Enter Your Password';
    }
    return null;

  }





  Future<void> signIn(BuildContext context) async {
    String email = _emailController.value.text.trim();
    String password = _passwordController.value.text.trim();
    EasyLoading.show();
    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password);
      if(user.user!=null){

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder) {
          return const MyHomePage();
        }));

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Congratulation!!!',
              message: 'Your have Log In successfully',
              contentType: ContentType.success,
            ),
          ));
      }

      clearSignInPageController();

    }
    on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found') {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Sorry!!!',
              message: 'User Not Found',
              contentType: ContentType.failure,
            ),
          ));
      }
      else if(e.code=='wrong-password'){
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Sorry!!!',
              message: 'Wrong Password',
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
    }

    EasyLoading.dismiss();

  }


}


