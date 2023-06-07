import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/core/controllers/main_binding.dart';
import 'package:untitled/ui/screens/auth/signin_screen.dart';
import 'package:untitled/ui/screens/home/home_screen.dart';
import 'package:untitled/ui/screens/splash/splash_screen.dart';
import 'package:untitled/ui/tabs/all_complaints.dart';
import 'core/constant/app_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MainBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.get(isLight: true),
              darkTheme: AppTheme.get(isLight: false),
               home:
               const SplashScreen(),
              builder: EasyLoading.init(),

          );
        }
    );
  }
}

