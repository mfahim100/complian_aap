import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/core/models/complaint_model.dart';
import 'package:uuid/uuid.dart';

import '../models/user_model.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  static final DatabaseService _singleton = DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

  DatabaseService._internal();



  Future<void> insertUserData(
    name,
    mobileNumber,
    department,
    samester,
    registrationNumber,
  ) async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      await _db.collection('user').doc(user!.uid).set({
        "uid": user!.uid,
        "email": user!.email,
        "name": name,
        "mobileNumber": mobileNumber,
        "department": department,
        "samester": samester,
        "registrationNumber": registrationNumber,
        "imgUrl": '',
      });
    } catch (e, s) {
      print('Exception @DatabaseService/registerPatient $e');
//      print(s);
    }
  }




  Future<void> addComplaintData(
      compliantID,
      complaintTitle,
    complaint
  ) async {
    var compliantUid = const Uuid().v1();
    User? user = FirebaseAuth.instance.currentUser;
    await getUser(user!.uid).then((usr) async {
      try {

        await _db.collection('Complaint').doc(compliantUid).set({
          "compliantUid": compliantUid,
          "uid": usr!.uid,
          "email": usr.email,
          "name": usr.name,
          "samester": usr.samester,
          "registrationNumber": usr.registrationNumber,
          "department": usr.department,
          "complaintTitle": complaintTitle,
          "complaint": complaint,
          "complaintID": compliantID,
          "status":0
        });
      } catch (e, s) {
        print('Exception @DatabaseService/registerPatient $e');
//      print(s);
      }
    });
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      final snapshot = await _db.collection('user').doc(uid).get();
      UserModel mdl = UserModel.fromMap(snapshot.data()!);
      return mdl;

    } catch (e, s) {
      print('Exception @DatabaseService/getUser $e');
    }
    return null;
  }





  Future<List<ComplaintModel>> getAllComplaint() async {
    List<ComplaintModel> mdl = [];
    try {
      final snapshot = await _db.collection('Complaint').get();
      for (var element in snapshot.docs) {
        ComplaintModel mddl = ComplaintModel.fromMap(element.data());
        print(element.id);
        mdl.add(mddl);
      }
      print(mdl.length);
      print('ALL Complaint length ${snapshot.size}');
    } catch (e, s) {
      print('Exception @DatabaseService/getPendingTask $e');
    }
    return mdl;
  }

  ///////////////////////////////////////////////////////////////////////

  Future<List<ComplaintModel>> getPendingComplaint() async {
    List<ComplaintModel> mdl = [];
    try {
      final snapshot = await _db.collection('Complaint').where('status',isEqualTo: 0).get();
      for (var element in snapshot.docs) {
        ComplaintModel mddl = ComplaintModel.fromMap(element.data());
        print(element.id);
        mdl.add(mddl);
      }
      print(mdl.length);
      print('Pending Complaints length ${snapshot.size}');
    } catch (e, s) {
      print('Exception @DatabaseService/getPendingTask $e');
    }
    return mdl;
  }

  ////////////////////////////////////////////////////////////////////

  Future<List<ComplaintModel>> getInProcessComplaint() async {
    List<ComplaintModel> mdl = [];
    try {
      final snapshot = await _db.collection('Complaint').where('status',isEqualTo: 1).get();
      for (var element in snapshot.docs) {
        ComplaintModel mddl = ComplaintModel.fromMap(element.data());
        print(element.id);
        mdl.add(mddl);
      }
      print(mdl.length);
      print('In Process length ${snapshot.size}');
    } catch (e, s) {
      print('Exception @DatabaseService/getPendingTask $e');
    }
    return mdl;
  }


  /////////////////////////////////////////////////////

  Future<List<ComplaintModel>> getCompletedComplaint() async {
    List<ComplaintModel> mdl = [];
    try {
      final snapshot = await _db.collection('Complaint').where('status',isEqualTo: 2).get();
      for (var element in snapshot.docs) {
        ComplaintModel mddl = ComplaintModel.fromMap(element.data());
        print(element.id);
        mdl.add(mddl);
      }
      print(mdl.length);
      print('Completed Complaint length ${snapshot.size}');
    } catch (e, s) {
      print('Exception @DatabaseService/getPendingTask $e');
    }
    return mdl;
  }



  //////////////////////////////////////////////////////////////////////////


  Future<List<ComplaintModel>> getMyComplaint() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    List<ComplaintModel> mdl = [];
    try {
      final snapshot =
          await _db.collection('Complaint').where('uid', isEqualTo: uid).get();
      for (var element in snapshot.docs) {
        ComplaintModel mddl = ComplaintModel.fromMap(element.data());
        print(element.id);
        mdl.add(mddl);
      }

      print(mdl.length);
      print('Complaint length ${snapshot.size}');

    }
    catch (e, s) {
      print('Exception @DatabaseService/getPendingTask $e');
    }
    return mdl;
  }




  ////////////////////////////
  Future<void> updateProfile(UserModel userModel)async{

    print(userModel.uid);
    try {
      await _db.collection('user').doc(userModel!.uid).set(userModel.toMap());
    } catch (e, s) {
      print('Exception @DatabaseService/registerPatient $e');
      print('Image URL ');
      print(userModel.imgUrl);
//      print(s);
    }
  }




}
