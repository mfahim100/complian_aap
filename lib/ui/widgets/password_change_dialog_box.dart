import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/core/constant/const_decoration.dart';
import 'package:untitled/core/constant/const_text_styles.dart';
import 'package:untitled/core/controllers/profile_controller.dart';
import 'package:untitled/ui/widgets/custom_button.dart';
import 'package:untitled/ui/widgets/custom_text_filed.dart';

class PasswordChangeDialogBox extends StatelessWidget {
   PasswordChangeDialogBox({Key? key}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      width: 100.w,
      height: 100.h,
      child: Center(
        child: Container(
          height: 50.h,
              width: 95.w,
              decoration: ConstDecorations.passwordDialogBoxDecoration,
              child: Form(
                key: profileController.passwordFormKey,
                child: Column(
                  children: [
                    SizedBox(height: 5.h,),
                    Text(
                      'Change Password',
                      style: ConstTextStyles.changePassword,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: 90.w,
                      child: CustomTextField(
                        hintText: 'New Password',
                        labelText: ' Enter Your New Password',
                        validator: profileController.newPasswordValidator,
                        controller: profileController.newPasswordController,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: 90.w,
                      child: CustomTextField(
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                      controller: profileController.confirmPasswordController,
                        validator: profileController.newPasswordValidator,
                      ),
                    ),

                    SizedBox(height: 2.h,),

                    SizedBox(
                      width: 90.w,
                      child: CustomButton(text: 'Change Password', onPressed: (){
                        if(profileController.passwordFormKey.currentState!.validate()){
                          profileController.changePassword();
                        }

                      }),
                    ),

                    SizedBox(
                      height: 2.h,
                    ),

                    SizedBox(
                      width: 90.w,
                      child: CustomButton(text: 'Cancel', onPressed: (){
                    Navigator.of(context).pop();
                      }),
                    ),

                  ],
                ),
              ),
            ),
      ),
    ));
  }
}
