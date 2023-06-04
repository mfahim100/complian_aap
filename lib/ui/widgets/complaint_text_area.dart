import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComplaintTextArea extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextInputType textInputType;
  TextEditingController? controller = TextEditingController();
  final String? Function(String?)? validator;

  ComplaintTextArea({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.textInputType = TextInputType.text,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 10,
      textAlign: TextAlign.start,

      validator: validator,
      keyboardType: textInputType,
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(

        errorStyle: const TextStyle(color: Colors.white),
        hintStyle:  TextStyle(color: Colors.white,fontSize: 18.sp),
        labelStyle:  TextStyle(color: Colors.white,fontSize: 18.sp),
        fillColor: Colors.white,
        hintText: hintText,
        labelText: labelText,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
        ),
      ),
    );
  }
}
