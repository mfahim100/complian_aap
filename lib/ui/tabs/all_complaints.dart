import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/core/constant/const_text_styles.dart';
import 'package:untitled/ui/tabs/profile_screen.dart';

import '../../core/constant/const_decoration.dart';
import '../../core/controllers/all_complaints_controller.dart';
import '../../core/models/compaint_model.dart';

class AllComplaints extends StatelessWidget {
  AllComplaints({Key? key}) : super(key: key);

  final AllComplaintsController allComplaintsController =
      Get.find<AllComplaintsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('All Complaints'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) {
                  return ProfileScreen();
                }));
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: Container(
        decoration: ConstDecorations.addComplaintMainDecoration,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: SizedBox(
            height: 95.h,
            child: Obx(
              () => allComplaintsController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: allComplaintsController.getAllComplaint.length,
                      itemBuilder: (context, index) {
                        ComplaintModel mdl =
                            allComplaintsController.getAllComplaint[index];
                        return Column(
                          children: [
                            Container(
                              decoration:
                                  ConstDecorations.complaintScreenContainer,
                              width: 90.w,
                              height: 20.h,
                              child: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          'Secret Key: ${mdl.complaintSecretKey}',
                                          style: TextStyle(
                                              fontSize: 19.sp,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          'Complaint Description: ${mdl.description!}',
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          'Complaint: ${mdl.complaint!}',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        width: 25.w,
                                        height: 3.h,
                                        decoration:
                                            ConstDecorations.statusDecoration,
                                        child: Center(
                                          child: Text(
                                            mdl.status == 0
                                                ? 'Pending'
                                                : mdl.status == 1
                                                    ? 'In Process'
                                                    : 'Complete',
                                            style:
                                                ConstTextStyles.statusContainer,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                          ],
                        );
                      }),
            ),
          ),
        ),
      ),
    );
  }
}
