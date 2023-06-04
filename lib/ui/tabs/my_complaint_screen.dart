import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/core/constant/const_decoration.dart';
import 'package:untitled/core/models/compaint_model.dart';
import '../../core/controllers/main_controller.dart';

class MyComplaintScreen extends StatelessWidget {
   MyComplaintScreen({Key? key}) : super(key: key);


  final MyComplaintController mainController = Get.find<MyComplaintController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ConstDecorations.addComplaintMainDecoration,
        child: Padding(
          padding:  EdgeInsets.all(2.h),
          child: SizedBox(
            height: 98.h,
            child: Obx(() => mainController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: mainController.getMyComplaint.length,
                    itemBuilder: (context, index) {
                      ComplaintModel mdl =
                          mainController.getMyComplaint[index];
                      return Column(
                        children: [
                          Container(
                            decoration: ConstDecorations.complaintScreenContainer,
                            width: 90.w,
                            height: 20.h,
                            child: Padding(
                              padding:  EdgeInsets.all(2.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name: ${mdl.name!}',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                                  SizedBox(height: .5.h,),
                                  Text('Department: ${mdl.department!}',style: TextStyle(fontSize: 17.sp,color: Colors.white),),
                                  SizedBox(height: .5.h,),
                                  Text('Complaint Description: ${mdl.description!}',style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                                  SizedBox(height: .5.h,),
                                  Text('Complaint: ${mdl.complaint!}',style: TextStyle(fontSize: 15.sp,color: Colors.white),),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 1.5.h,),
                        ],
                      );

                    }
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
