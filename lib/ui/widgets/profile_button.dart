import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constant/const_text_styles.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Function() onPressed;

  const ProfileButton({
    Key? key,
    required this.text,
    this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 90.w,
        height: 05.h,
        decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Padding(
          padding: EdgeInsets.only(left:4.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            icon!,
              SizedBox(width: 5.w,),
              Text(text, style: ConstTextStyles.profileButton),
            ],
          ),
        ),
      ),
    );
  }
}
