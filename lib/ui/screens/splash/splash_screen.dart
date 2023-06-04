import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/core/constant/const_decoration.dart';
import 'package:untitled/core/constant/const_text.dart';
import 'package:untitled/core/constant/const_text_styles.dart';

import '../auth/signin_screen.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadScreen();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: ConstDecorations.splashScreen,
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                ConstText.splashWelcomeText,
                style: ConstTextStyles.splashWelcomeText,
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 40.h,
                width: 90.w,
                child: const Image(
                  image: AssetImage('assets/images/Uomlogo.png'),
                ),
              ),


              Text(
                'University of Malakand',
                style: ConstTextStyles.splashSecondaryText,
              ),

              Text(
                'Complaint Portal',
                style: ConstTextStyles.splashSecondaryText,
              ),
              SizedBox(
                height: 5.h,
              ),

            ],
          ),
        ),
      ),
    );
  }

  void loadScreen() {

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      FirebaseAuth.instance.currentUser == null
          ? SignInScreen()
          : const MyHomePage()), (Route<dynamic> route) => false);
    });
  }
}
