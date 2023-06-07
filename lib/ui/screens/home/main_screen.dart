import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/core/constant/const_decoration.dart';
import 'package:untitled/core/constant/const_text_styles.dart';
import 'package:untitled/ui/tabs/add_compliant_screen.dart';
import 'package:untitled/ui/tabs/all_complaints.dart';
import 'package:untitled/ui/tabs/my_complaint_screen.dart';
import 'package:untitled/ui/tabs/feed_back.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100.h,
            width: 100.w,
          decoration: ConstDecorations.addComplaintMainDecoration,
          child: Column(
            children: [
              SizedBox(height: 10.h,),

              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                    return const AddComplaintScreen();
                  }));
                },
                child: Container(
                  height: 10.h,
                  width: 95.w,
                  decoration: ConstDecorations.mainContainerDecoration,
                  child: Center(child: Text('Add Complaint',style: ConstTextStyles.mainContainer,)),

                ),
              ),

              SizedBox(height: 3.h,),

              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                    return  MyComplaintScreen();
                  }));
                },
                child: Container(
                  height: 10.h,
                  width: 95.w,
                  decoration: ConstDecorations.mainContainerDecoration,
                  child: Center(child: Text('View Your Complaint',style: ConstTextStyles.mainContainer,)),

                ),
              ),

              SizedBox(height: 3.h,),

              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                    return AllComplaints();
                  }));
                },
                child: Container(
                  height: 10.h,
                  width: 95.w,
                  decoration: ConstDecorations.mainContainerDecoration,
                  child: Center(child: Text('View All Complaint',style: ConstTextStyles.mainContainer,)),

                ),
              ),

              SizedBox(height: 3.h,),

              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                    return  FeedBack();
                  }));
                },
                child: Container(
                  height: 10.h,
                  width: 95.w,
                  decoration: ConstDecorations.mainContainerDecoration,
                  child: Center(child: Text('FeedBack',style: ConstTextStyles.mainContainer,)),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
