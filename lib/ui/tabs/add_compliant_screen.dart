import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/core/controllers/compliant_screen_controller.dart';
import 'package:untitled/ui/widgets/custom_button.dart';
import '../../core/constant/const_decoration.dart';
import '../../core/constant/const_text_styles.dart';
import '../widgets/complaint_text_area.dart';
import '../widgets/complaint_textfield.dart';

class AddComplaintScreen extends StatefulWidget {
   const AddComplaintScreen({Key? key}) : super(key: key);

  @override
  State<AddComplaintScreen> createState() => _AddComplaintScreenState();
}

class _AddComplaintScreenState extends State<AddComplaintScreen> {
  ComplaintScreenController complaintScreenController = Get.put(ComplaintScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Complaint',style: ConstTextStyles.mainContainerComplaintScreen,),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: ConstDecorations.addComplaintMainDecoration,
          width: 100.w,
          height: 100.h,
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.all(1.h),
                child: Form(
                  key: complaintScreenController.complaintFormKey,
                  child: Column(
                    children: [
                      Container(
                        height: 75.h,
                        width: 95.h,
                        decoration: ConstDecorations.addComplaintSecondaryDecoration,
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Text('Add Your Complaint',
                                      style: ConstTextStyles.addCompliant)),
                              SizedBox(
                                height: 2.h,
                              ),

                              CompliantTextField(
                                controller: complaintScreenController.complaintSecretKeyController.value,
                                hintText: 'Enter Complaint Secret Key',
                                labelText: 'Secret Key',
                                validator: complaintScreenController.complaintSecretKeyValidator,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),

                              CompliantTextField(
                                controller: complaintScreenController.descriptionController.value,
                                hintText: 'Enter Complaint Description',
                                labelText: 'Description',
                                validator: complaintScreenController.descriptionValidator,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              ComplaintTextArea(
                                controller: complaintScreenController.complaintController.value,
                                hintText: 'Enter Your Complaint',
                                labelText: 'Enter Your Complaint',
                                validator: complaintScreenController.compliantValidator,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),

                              CustomButton(text: 'Add Complaint', onPressed: (){
                                if(complaintScreenController.complaintFormKey.currentState!.validate()){
                                  complaintScreenController.addComplaint(context);

                                }
                              })
                            ],
                          ),
                        ),
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
