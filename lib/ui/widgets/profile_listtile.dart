import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constant/const_text_styles.dart';

class ProfileListTile extends StatelessWidget {
  final String text;
  final String title;

  const ProfileListTile({
    Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 04.h,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 2.h, right: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: ConstTextStyles.profileListTile),
            Text(text, style: ConstTextStyles.profileListTile),
          ],
        ),
      ),
    );
  }
}
