import 'package:get/get.dart';
import 'package:untitled/core/controllers/profile_controller.dart';
import 'package:untitled/core/controllers/sign_in_controller.dart';
import 'package:untitled/core/controllers/sign_up_controller.dart';
import 'all_complaints_controller.dart';
import 'compliant_screen_controller.dart';
import 'main_controller.dart';


class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplaintScreenController>(() => ComplaintScreenController());
    Get.lazyPut<MyComplaintController>(() => MyComplaintController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<AllComplaintsController>(() => AllComplaintsController());


    Get.find<MyComplaintController>().getUserComplaint();
    Get.find<ProfileController>().getUser();
    Get.find<AllComplaintsController>().getUserAllComplaint();
    Get.find<AllComplaintsController>().pendingComplaint();
    Get.find<AllComplaintsController>().inProcessComplaint();
    Get.find<AllComplaintsController>().completedComplaint();


  }
}