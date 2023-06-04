import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/ui/screens/auth/signin_screen.dart';
import 'package:untitled/ui/widgets/get_pic_dialog.dart';
import 'package:untitled/ui/widgets/password_change_dialog_box.dart';
import 'package:untitled/ui/widgets/profile_listtile.dart';

import '../../core/constant/const_decoration.dart';
import '../../core/controllers/profile_controller.dart';
import '../widgets/profile_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);


  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: const Text('Profile Screen'),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.purple,
        width: 100.w,
        height: 100.h,
        child: Column(children: [
          Container(
            height: 32.h,
            decoration: ConstDecorations.profileContainerDecoration,
            child:
            Obx(() => Center(
              child: Stack(

                children: [
                  profileController.isLoading.value
                      ? CircleAvatar(
                    radius: 32.w,
                    backgroundColor: Colors.blue,
                    backgroundImage:const AssetImage(
                        'assets/images/avatar.jpg'),
                  )
                      : CircleAvatar(
                    radius: 32.w,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(
                        profileController.user!.imgUrl!),
                  ),
                  Positioned(
                    right: 3.h,
                    bottom: 1.h,
                    child: CircleAvatar(
                        radius: 6.w,
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context, builder: (context){
                              return GetPicDialog();
                            });
                          },
                          icon: const Icon(
                            Icons.camera_alt_rounded,
                            size: 30,
                          ),
                        )),
                  )
                ],
              ),
            ),),


          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              children: [
                  ProfileListTile(
                  title: 'Name:  ',
                  text: profileController.user!.name!
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                  ProfileListTile(
                  title: 'Mobile:',
                  text: profileController.user!.mobileNumber!
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                 ProfileListTile(
                  title: 'Email:  ',
                  text: profileController.user!.email!
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                 ProfileListTile(
                  title: 'Department',
                  text: profileController.user!.department!,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
              ],
            ),
          ),
          Column(
            children: [
              ProfileButton(
                icon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                text: 'Change Password',
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return PasswordChangeDialogBox();
                      });
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              ProfileButton(
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                text: 'Log Out',
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (builder) {
                    return SignInScreen();
                  }));
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
