class SubjectListModel {
  List<Result>? result;

  SubjectListModel({this.result});

  SubjectListModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? sId;
  int? totalLectures;
  String? department;
  String? subjectCode;
  String? subjectName;
  String? year;
  int? iV;

  Result(
      {this.sId,
        this.totalLectures,
        this.department,
        this.subjectCode,
        this.subjectName,
        this.year,
        this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    totalLectures = json['totalLectures'];
    department = json['department'];
    subjectCode = json['subjectCode'];
    subjectName = json['subjectName'];
    year = json['year'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['totalLectures'] = this.totalLectures;
    data['department'] = this.department;
    data['subjectCode'] = this.subjectCode;
    data['subjectName'] = this.subjectName;
    data['year'] = this.year;
    data['__v'] = this.iV;
    return data;
  }
}
