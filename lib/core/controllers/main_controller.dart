import 'package:get/get.dart';

import '../models/complaint_model.dart';
import '../services/database_services.dart';

class MyComplaintController extends GetxController{


  RxBool isLoading = true.obs;


  List<ComplaintModel> getMyComplaint = [];
  Future<void> getUserComplaint() async {
    getMyComplaint.clear();
    DatabaseService db = DatabaseService();
    getMyComplaint = await db.getMyComplaint().whenComplete((){
      isLoading.value = true;
      isLoading.value = false;
    });
  }



}