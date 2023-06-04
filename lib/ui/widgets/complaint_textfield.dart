import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CompliantTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextInputType textInputType;
  TextEditingController? controller = TextEditingController();
  final String? Function(String?)? validator;

  CompliantTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.textInputType = TextInputType.text,
    this.controller,
    this.validator,
    // required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: textInputType,
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        errorStyle: const TextStyle(
            color: Colors.white
        ),
        hintStyle: const TextStyle(
          color: Colors.white
        ),
        labelStyle: const TextStyle(
            color: Colors.white
        ),
        fillColor: Colors.white,
        hintText: hintText,
        labelText: labelText,
          //contentPadding:  EdgeInsets.symmetric(vertical: 05.h, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
        ),
      ),
    );
  }
}
