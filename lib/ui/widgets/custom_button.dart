import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constant/const_text_styles.dart';


class CustomButton extends StatelessWidget {
  final bool isSmall;
  final String text;
  final Function() onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,  this.isSmall=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: isSmall?4.h:7.h,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(3.w)),
        child: Center(
            child: Text(
          text,
              style: ConstTextStyles.createAccount,
      ),
    ),
    ),
    );
  }
}
