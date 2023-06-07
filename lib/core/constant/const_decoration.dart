import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConstDecorations{


  static var profileContainerDecoration = BoxDecoration(
  color: Colors.purpleAccent,
  boxShadow: [
  BoxShadow(
  color: Colors.purpleAccent,
  blurRadius: 15.sp,
  spreadRadius: 10.sp,
  blurStyle: BlurStyle.inner,
  ),
  ],
  borderRadius: BorderRadius.only(
  bottomRight: Radius.circular(15.w),
  bottomLeft: Radius.circular(15.w),
  ),
  );



  static var addComplaintMainDecoration = const BoxDecoration(
    color: Colors.blue,
    gradient: LinearGradient(
        colors: [
          Colors.blue,
          Colors.lightBlue,
          Colors.lightBlueAccent,
          Colors.blueGrey,
        ],
        end: Alignment.topRight,
        begin: Alignment.bottomLeft
    ),

  );


  static var addComplaintSecondaryDecoration = BoxDecoration(
    color: Colors.blue,
    boxShadow:  [
      BoxShadow(
          color: Colors.blueGrey,
          blurStyle: BlurStyle.inner,
          blurRadius: 15.sp,
          spreadRadius: 12.sp
      )],
    gradient: const LinearGradient(
        colors: [
          Colors.blue,
          Colors.lightBlue,
          Colors.lightBlueAccent,
          Colors.blueGrey,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft
    ),
    borderRadius: BorderRadius.circular(8.w),
  );



  static var complaintScreenContainer = BoxDecoration(
    color: Colors.black,
    boxShadow:  [
      BoxShadow(
          color: Colors.blueGrey,
          blurStyle: BlurStyle.inner,
          blurRadius: 10.sp,
          spreadRadius: 07.sp
      )],
    gradient: const LinearGradient(
        colors: [
          Colors.black12,
          Colors.black45,
          Colors.blueGrey,
          Colors.black45,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft
    ),
    borderRadius: BorderRadius.circular(8.w),
  );


  static var statusDecoration = BoxDecoration(
    color: Colors.black,
    boxShadow:  [
      BoxShadow(
          color: Colors.black,
          blurStyle: BlurStyle.outer,
          blurRadius: 10.sp,
          spreadRadius: 07.sp
      )],
    gradient: const LinearGradient(
        colors: [
          Colors.black,
          Colors.black45,
          Colors.grey,
          Colors.black,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft
    ),
    borderRadius: BorderRadius.circular(8.w),
  );



  static var splashScreen = BoxDecoration(
    color: Colors.black,
    boxShadow:  [
      BoxShadow(
          color: Colors.white70,
          blurStyle: BlurStyle.inner,
          blurRadius: 10.sp,
          spreadRadius: 07.sp
      )],
    gradient: const LinearGradient(
        colors: [
          Colors.white,
          Colors.white70,
          Colors.white,
          Colors.black26,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft
    ),

  );



  static var passwordDialogBoxDecoration = BoxDecoration(
    color: Colors.blue,
    boxShadow:  [
      BoxShadow(
          color: Colors.blueGrey,
          blurStyle: BlurStyle.inner,
          blurRadius: 10.sp,
          spreadRadius: 05.sp
      )],
    gradient: const LinearGradient(
        colors: [
          Colors.blue,
          Colors.lightBlue,
          Colors.lightBlueAccent,
          Colors.blueGrey,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft
    ),
    borderRadius: BorderRadius.circular(5.w),
  );

  static var mainContainerDecoration = BoxDecoration(
    color: Colors.black,
    boxShadow:  [
      BoxShadow(
          color: Colors.black,
          blurStyle: BlurStyle.inner,
          blurRadius: 08.sp,
          spreadRadius: 05.sp
      )],
    gradient: const LinearGradient(
        colors: [
          Colors.black,
          Colors.black45,
          Colors.grey,
          Colors.black,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft
    ),
    borderRadius: BorderRadius.circular(8.w),
  );

}