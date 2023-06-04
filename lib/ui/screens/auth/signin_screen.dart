import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/ui/screens/auth/signup_screen.dart';
import '../../../core/constant/const_text_styles.dart';
import '../../../core/controllers/sign_in_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_filed.dart';

class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);

 final SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            children: [
              Container(
                height: 6.h,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Sign In Page',
                    style: ConstTextStyles.mainContainerSignIn,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                  child:  Image(
                    height: 25.h,
                    width: 85.w,
                    image: const AssetImage('assets/images/Uomlogo.png'),
                  )),

              SizedBox(
                height: 1.5.h,
              ),
              Padding(
                padding: EdgeInsets.all(2.h),
                child: Form(
                   key: signInController.signInKey,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Log In',
                            style: ConstTextStyles.logIn,
                          )),

                      SizedBox(
                        height: 3.h,
                      ),
                      CustomTextField(
                        controller: signInController.emailController.value,
                         validator: signInController.emailValidator,
                          hintText: 'Enter Your Email',
                          labelText: 'Email',
                          prefix: const Icon(Icons.email)),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      CustomTextField(
                        obscureText: true,
                        controller: signInController.passwordController.value,
                        validator: signInController.passwordValidator,
                        hintText: 'Enter YourPassword',
                        labelText: 'Password',
                        prefix: const Icon(Icons.lock),
                      ),
                      SizedBox(
                        height:3.5.h,
                      ),
                      CustomButton(text: 'Log In', onPressed: () {
                        signInController.signIn(context);

                        // Get.to(const HomeScreen());
                      }),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don,t have Account?',
                            style: ConstTextStyles.textButtonTextStyle,
                          ),
                          TextButton(
                            child: Text(
                              'Sign Up',
                              style: ConstTextStyles.textButtonTextStyle,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                                return SignUpScreen();
                              }));
                              //Get.to(const SignUpScreen());
                            },
                          ),
                        ],
                      ),
                    ],
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
