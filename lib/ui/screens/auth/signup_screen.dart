import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/core/constant/const_text.dart';
import 'package:untitled/core/controllers/sign_up_controller.dart';
import 'package:untitled/ui/screens/auth/signin_screen.dart';
import '../../../core/constant/const_text_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_filed.dart';

class SignUpScreen extends StatelessWidget {
     SignUpScreen({Key? key}) : super(key: key);

  final SignUpController signUpController = Get.put(SignUpController());


  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            children: [
              Container(
                height: 5.h,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child:  Center(
                  child: Text(
                    ConstText.mainContainerSignUp,
                    style: ConstTextStyles.mainContainerSignUp,
                  ),
                ),
              ),

              SizedBox(
                width: 100.w,
                height: 87.h,
                child: Padding(
                  padding: EdgeInsets.all(1.5.h),
                  child: SingleChildScrollView(
                    child: Form(
                       key: signUpController.signUpKey,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                ConstText.signUpWelcomeText,
                                style: ConstTextStyles.signUpWelcomeText,
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                  ConstText.registerHere,
                                  style: ConstTextStyles.registerHere
                              )),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          CustomTextField(
                            validator: signUpController.nameValidator,
                             controller: signUpController.nameController.value,
                              hintText: 'Name',
                              labelText: 'Enter Your Name',
                              prefix: const Icon(Icons.person)),
                          SizedBox(
                            height: 1.5.h,
                          ),

                          CustomTextField(
                            validator: signUpController.mobileValidator,
                            controller: signUpController.mobileController.value,
                              hintText: 'Mobile',
                              labelText: 'Enter Your Mobile Number',
                              maxLength: 11,
                              textInputType: TextInputType.number,
                              prefix: const Icon(Icons.phone)),

                          SizedBox(
                            height: 1.5.h,
                          ),

                          CustomTextField(
                            validator: signUpController.emailValidator,
                            controller: signUpController.emailController.value,
                              hintText: 'Enter Your Email',
                              labelText: 'Email',
                              prefix: const Icon(Icons.email)
                          ),

                          SizedBox(
                            height: 1.5.h,
                          ),
                          CustomTextField(
                            controller: signUpController.departmentController.value,
                            hintText: 'Enter your Department',
                            labelText: 'Department',
                            validator: signUpController.departmentValidator,
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          CustomTextField(
                            controller: signUpController.samesterController.value,
                            hintText: 'Enter your Semester',
                            labelText: 'Semester',
                            validator: signUpController.samesterValidator,
                          ),

                          SizedBox(height: 1.5.h,),

                          CustomTextField(
                            controller: signUpController.registrationNumberController.value,
                            hintText: 'Enter your University Registration Number',
                            labelText: 'Registration Number',
                            validator: signUpController.registrationNumberValidator,
                          ),

                          SizedBox(height: 1.5.h,),
                          CustomTextField(
                            validator: signUpController.passwordValidator,
                            controller: signUpController.passwordController.value,
                            obscureText: true,
                            hintText: 'Enter YourPassword',
                            labelText: 'Password',
                            prefix: const Icon(Icons.lock),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          CustomTextField(
                            validator: signUpController.confirmPasswordValidator,
                            controller: signUpController.confirmPasswordController.value,
                              obscureText: true,
                              hintText: 'Confirm Password',
                              labelText: 'Confirm Password',
                              prefix: const Icon(Icons.lock)),
                          SizedBox(
                            height: 2.h,
                          ),

                          CustomButton(text: 'Create Account', onPressed: () {
                           if(signUpController.signUpKey.currentState!.validate()){
                             signUpController.signUp(context);
                           }
                          }),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already Have Account?',
                                style: ConstTextStyles.textButtonTextStyle,
                              ),
                              TextButton(
                                child:  Text(
                                    'Sign In',
                                    style: ConstTextStyles.textButtonTextStyle
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                                    return  SignInScreen();
                                  }));
                                  //Get.to(const SignInScreen());
                                },
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
