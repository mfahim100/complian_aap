class ComplaintModel{

  String? uid;
  String? compliantId;
  String? email;
   String? department;
   String? samester;
   String? registrationNumber;
  String? description;
  String? complaint;
  String? name;
  int? status;
 String? complaintSecretKey;

  ComplaintModel({
    this.uid,
    this.compliantId,
    this.email,
     required this.department,
     required this.samester,
     required this.registrationNumber,
    required this.description,
    required this.complaint,
    required this.name,
    required this.status,
    required this.complaintSecretKey,
  });



  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['uid'] = uid;
    map['compliantId'] = compliantId;
    map['email'] = email;
     map['department'] = department;
     map['samester'] = samester;
     map['registrationNumber'] = registrationNumber;
    map['description'] = description;
    map['complaint'] =complaint ;
    map['name'] =name ;
    map['status'] =status ;
    map['complaintSecretKey'] =complaintSecretKey ;

    return map;
  }

  ComplaintModel.fromMap(Map<String, dynamic> map){
    uid = map['uid']??"";
    compliantId = map['compliantId']??"";
    email = map['email']??"";
    department = map['department'];
    samester = map['samester'];
    registrationNumber = map['registrationNumber'];
    description = map['description']??"";
    complaint = map['complaint']??"";
    name = map['name']??"";
    status = map['status']??"";
    complaintSecretKey = map['complaintSecretKey']??"";
  }


  ComplaintModel? copyWith({
    String? uid,
    String? compliantId,
    String? email,
    String? department,
    String? samester,
    String? registrationNumber,
    String? description,
    String? complaint,
    String? name,
    int? status,
    String? complaintSecretKey,
  }) =>
      ComplaintModel(
          uid: uid??this.uid,
          compliantId: compliantId??this.compliantId,
          email: email??this.email,
          department: department??this.department,
          samester: samester ?? this.samester,
          registrationNumber: registrationNumber ?? this.registrationNumber,
          description: description?? this.description,
          complaint: complaint?? this.complaint,
          name: name?? this.name,
          status: status?? this.status,
          complaintSecretKey: complaintSecretKey?? this.complaintSecretKey
      );




}