class getStudentModel {
  bool? status;
  List<Result>? result;
  List<String>? subjectCode;

  getStudentModel({this.status, this.result, this.subjectCode});

  getStudentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    subjectCode = json['subjectCode'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['subjectCode'] = this.subjectCode;
    return data;
  }
}

class Result {
  String? sId;
  String? registrationNumber;
  String? name;

  Result({this.sId, this.registrationNumber, this.name});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    registrationNumber = json['registrationNumber'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['registrationNumber'] = this.registrationNumber;
    data['name'] = this.name;
    return data;
  }
}
