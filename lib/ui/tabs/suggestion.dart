import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/core/constant/const_decoration.dart';

import '../../core/constant/const_text_styles.dart';
import '../../core/controllers/all_complaints_controller.dart';

class Suggestion extends StatelessWidget {
   Suggestion({Key? key}) : super(key: key);

  final AllComplaintsController allComplaintsController =
  Get.find<AllComplaintsController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ConstDecorations.addComplaintMainDecoration,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: SizedBox(
            height: 90.h,
            child: Obx(() => allComplaintsController.isLoading.value
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 10.h,
                    width: 90.w,
                    decoration:
                    ConstDecorations.complaintScreenContainer,
                    child: Center(
                      child: Text(
                        'All complaints :  ${allComplaintsController.getAllComplaint.length}',
                        style:
                        ConstTextStyles.homeScreenContainer,
                      ),
                    )
                  ),

                  SizedBox(height: 3.h,),

                  Container(
                    height: 10.h,
                    width: 90.w,
                    decoration:
                    ConstDecorations.complaintScreenContainer,
                    child: Center(
                      child: Text(
                        'Pending Complaints :  ${allComplaintsController.getPendingComplaint.length}',
                        style:
                        ConstTextStyles.homeScreenContainer,
                      ),
                    )
                  ),

                  SizedBox(height: 3.h,),

                  Container(
                    height: 10.h,
                    width: 90.w,
                    decoration:
                    ConstDecorations.complaintScreenContainer,
                    child: Center(
                      child: Text(
                        'In Process Complaint:  ${allComplaintsController.getInProcessComplaint.length}',
                        style:
                        ConstTextStyles.homeScreenContainer,
                      ),
                    )
                  ),
                  SizedBox(height: 3.h,),
                  Container(
                    height: 10.h,
                    width: 90.w,
                    decoration:
                    ConstDecorations.complaintScreenContainer,
                    child: Center(
                      child: Text(
                        'Complete Complaints:  ${allComplaintsController.getCompletedComplaint.length}',
                        style:
                        ConstTextStyles.homeScreenContainer,
                      ),
                    )
                  ),
                  SizedBox(height: 3.h,),

                ],
              ),
            ),

            ),
          ),
        ),
      ),
    );
  }
}
