import 'package:get/get.dart';

import '../models/compaint_model.dart';
import '../services/database_services.dart';

class MyComplaintController extends GetxController{


  RxBool isLoading = true.obs;


  List<ComplaintModel> getMyComplaint = [];
  Future<void> getUserComplaint() async {
    getMyComplaint.clear();
    DatabaseService db = DatabaseService();
    getMyComplaint = await db.getMyComplaint().whenComplete(() => isLoading.value=false);
  }



}