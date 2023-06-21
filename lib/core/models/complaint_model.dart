class ComplaintModel{

  String? uid;
  String? compliantUid;
  String? email;
   String? department;
   String? samester;
   String? registrationNumber;
  String? complaintTitle;
  String? complaint;
  String? name;
  int? status;
 String? compliantID;

  ComplaintModel({
    this.uid,
    this.compliantUid,
    this.email,
     required this.department,
     required this.samester,
     required this.registrationNumber,
    required this.complaintTitle,
    required this.complaint,
    required this.name,
    required this.status,
    required this.compliantID,
  });



  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['uid'] = uid;
    map['compliantUid'] = compliantUid;
    map['email'] = email;
     map['department'] = department;
     map['samester'] = samester;
     map['registrationNumber'] = registrationNumber;
    map['complaintTitle'] = complaintTitle;
    map['complaint'] =complaint ;
    map['name'] =name ;
    map['status'] =status ;
    map['compliantID'] =compliantID ;

    return map;
  }

  ComplaintModel.fromMap(Map<String, dynamic> map){
    uid = map['uid']??"";
    compliantUid = map['compliantUid']??"";
    email = map['email']??"";
    department = map['department'];
    samester = map['samester'];
    registrationNumber = map['registrationNumber'];
    complaintTitle = map['complaintTitle']??"";
    complaint = map['complaint']??"";
    name = map['name']??"";
    status = map['status']??"";
    compliantID = map['compliantID']??"";
  }


  ComplaintModel? copyWith({
    String? uid,
    String? compliantUid,
    String? email,
    String? department,
    String? samester,
    String? registrationNumber,
    String? complaintTitle,
    String? complaint,
    String? name,
    int? status,
    String? compliantID,
  }) =>
      ComplaintModel(
          uid: uid??this.uid,
          compliantUid: compliantUid??this.compliantUid,
          email: email??this.email,
          department: department??this.department,
          samester: samester ?? this.samester,
          registrationNumber: registrationNumber ?? this.registrationNumber,
          complaintTitle: complaintTitle?? this.complaintTitle,
          complaint: complaint?? this.complaint,
          name: name?? this.name,
          status: status?? this.status,
          compliantID: compliantID?? this.compliantID
      );




}