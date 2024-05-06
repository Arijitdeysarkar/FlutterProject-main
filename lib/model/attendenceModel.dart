class AttendenceModel {
  bool? success;
  List<Result>? result;

  AttendenceModel({this.success, this.result});

  AttendenceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? attendence;
  String? subjectCode;
  String? subjectName;
  int? maxHours;
  int? absentHours;
  int? lectureAttended;
  int? totalLecturesByFaculty;

  Result(
      {this.attendence,
        this.subjectCode,
        this.subjectName,
        this.maxHours,
        this.absentHours,
        this.lectureAttended,
        this.totalLecturesByFaculty});

  Result.fromJson(Map<String, dynamic> json) {
    attendence = json['attendence'];
    subjectCode = json['subjectCode'];
    subjectName = json['subjectName'];
    maxHours = json['maxHours'];
    absentHours = json['absentHours'];
    lectureAttended = json['lectureAttended'];
    totalLecturesByFaculty = json['totalLecturesByFaculty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendence'] = this.attendence;
    data['subjectCode'] = this.subjectCode;
    data['subjectName'] = this.subjectName;
    data['maxHours'] = this.maxHours;
    data['absentHours'] = this.absentHours;
    data['lectureAttended'] = this.lectureAttended;
    data['totalLecturesByFaculty'] = this.totalLecturesByFaculty;
    return data;
  }
}
