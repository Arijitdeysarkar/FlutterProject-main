class studentByNameModel {
  bool? status;
  List<Resultt>? result;

  studentByNameModel({this.status, this.result});

  studentByNameModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Resultt>[];
      json['result'].forEach((v) {
        result!.add(new Resultt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Resultt {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? department;
  int? studentMobileNumber;
  int? year;
  String? registrationNumber;
  String? section;
  String? batch;
  List<Subjects>? subjects;
  String? dob;
  int? fatherMobileNumber;
  String? fatherName;
  String? gender;
  int? aadharCard;
  String? token;
  String? avatar;
  int? iV;
  String? otp;

  Resultt(
      {this.sId,
      this.name,
      this.email,
      this.password,
      this.department,
      this.studentMobileNumber,
      this.year,
      this.registrationNumber,
      this.section,
      this.batch,
      this.subjects,
      this.dob,
      this.fatherMobileNumber,
      this.fatherName,
      this.gender,
      this.aadharCard,
      this.token,
      this.avatar,
      this.iV,
      this.otp});

  Resultt.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    department = json['department'];
    studentMobileNumber = json['studentMobileNumber'];
    year = json['year'];
    registrationNumber = json['registrationNumber'];
    section = json['section'];
    batch = json['batch'];
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
    dob = json['dob'];
    fatherMobileNumber = json['fatherMobileNumber'];
    fatherName = json['fatherName'];
    gender = json['gender'];
    aadharCard = json['aadharCard'];
    token = json['token'];
    avatar = json['avatar'];
    iV = json['__v'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['department'] = this.department;
    data['studentMobileNumber'] = this.studentMobileNumber;
    data['year'] = this.year;
    data['registrationNumber'] = this.registrationNumber;
    data['section'] = this.section;
    data['batch'] = this.batch;
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    data['dob'] = this.dob;
    data['fatherMobileNumber'] = this.fatherMobileNumber;
    data['fatherName'] = this.fatherName;
    data['gender'] = this.gender;
    data['aadharCard'] = this.aadharCard;
    data['token'] = this.token;
    data['avatar'] = this.avatar;
    data['__v'] = this.iV;
    data['otp'] = this.otp;
    return data;
  }
}

class Subjects {
  String? name;
  String? sId;

  Subjects({this.name, this.sId});

  Subjects.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['_id'] = this.sId;
    return data;
  }
}
