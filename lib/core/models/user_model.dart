class UserModel{

   String? uid;
   String? name;
   String? mobileNumber;
   String? email;
   String? imgUrl;
   String? samester;
   String? registrationNumber;
   String? department;


  UserModel({
    this.uid,
    required this.name,
    required this.mobileNumber,
    required this.email,
    required this.imgUrl,
    required this.samester,
    required this.registrationNumber,
    required this.department,
});



  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['uid'] = uid;
    map['name'] = name;
    map['mobileNumber'] = mobileNumber;
    map['email'] = email;
    map['imgUrl'] =imgUrl ;
    map['samester'] =samester ;
    map['registrationNumber'] =registrationNumber ;
    map['department'] =department ;

    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map){
    uid = map['uid']??"";
    name = map['name']??"";
    mobileNumber = map['mobileNumber']??"";
    email = map['email']??"";
    imgUrl = map['imgUrl']??"";
    samester = map['samester']??"";
    registrationNumber = map['registrationNumber']??"";
    department = map['department']??"";
  }


  UserModel? copyWith({
    String? uid,
    String? name,
    String? mobileNumber,
    String? email,
    String? imgUrl,
    String? samester,
    String? registrationNumber,
    String? department,
  }) =>
      UserModel(
          uid: uid??this.uid,
          name: name ?? this.name,
          mobileNumber: mobileNumber ?? this.mobileNumber,
          email: email?? this.email,
          imgUrl: imgUrl?? this.imgUrl,
          samester: samester?? this.samester,
          registrationNumber: registrationNumber?? this.registrationNumber,
          department: department?? this.department
      );


}