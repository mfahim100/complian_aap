import 'package:get/get.dart';

import '../models/complaint_model.dart';
import '../services/database_services.dart';

class AllComplaintsController extends GetxController {
  RxBool isLoading = true.obs;

  List<ComplaintModel> getAllComplaint = [];

  Future<void> getUserAllComplaint() async {
    getAllComplaint.clear();
    DatabaseService db = DatabaseService();
    getAllComplaint = await db.getAllComplaint().whenComplete(() {
      isLoading.value = true;
      isLoading.value = false;
    });
  }

  List<ComplaintModel> getPendingComplaint = [];
  Future<void> pendingComplaint() async {
    getPendingComplaint.clear();
    DatabaseService db = DatabaseService();
    getPendingComplaint = await db
        .getPendingComplaint()
        .whenComplete(() {
      isLoading.value = true;
      isLoading.value = false;
    });
  }


  List<ComplaintModel> getInProcessComplaint = [];
  Future<void> inProcessComplaint() async {
    getInProcessComplaint.clear();
    DatabaseService db = DatabaseService();
    getInProcessComplaint = await db
        .getInProcessComplaint()
        .whenComplete(() {
      isLoading.value = true;
      isLoading.value = false;

    });
  }


  List<ComplaintModel> getCompletedComplaint = [];
  Future<void> completedComplaint() async {
    getCompletedComplaint.clear();
    DatabaseService db = DatabaseService();
    getCompletedComplaint = await db
        .getCompletedComplaint()
        .whenComplete(() {
      isLoading.value = true;
      isLoading.value = false;
    });
  }
}
