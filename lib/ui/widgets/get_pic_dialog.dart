import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constant/const_decoration.dart';
import '../../core/constant/const_text_styles.dart';
import '../../core/controllers/profile_controller.dart';
import 'custom_button.dart';

class GetPicDialog extends StatelessWidget {
  GetPicDialog({Key? key}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Center(
        child: Container(
          height: 40.h,
          width: 95.w,
          decoration: ConstDecorations.passwordDialogBoxDecoration,
          child: Column(
            children: [
              SizedBox(height: 3.h,),
              Text(
                'Upload Profile Picture',
                style: ConstTextStyles.changePassword,
              ),
              SizedBox(
                height: 2.h,
              ),

              SizedBox(
                width: 90.w,
                child: CustomButton(
                    text: 'Upload From Gallery', onPressed: () {
                      profileController.getPicture(context,ImageSource.gallery);
                }),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 90.w,
                child: CustomButton(text: 'Upload From camera', onPressed: () {
                  profileController.getPicture(context,ImageSource.camera);
                }),
              ),
              SizedBox(height: 2.h,),


              SizedBox(
                width: 90.w,
                child: CustomButton(text: 'Cancel', onPressed: () {
                  Navigator.of(context).pop();
                }),
              )

            ],
          ),
        ),
      ),
    );
  }
}
