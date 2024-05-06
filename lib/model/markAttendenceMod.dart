class markAttendenceMod {
  List<String>? selectedStudents;
  String? subjectCode;
  String? department;
  String? year;
  String? section;

  markAttendenceMod(
      {this.selectedStudents,
      this.subjectCode,
      this.department,
      this.year,
      this.section});

  markAttendenceMod.fromJson(Map<String, dynamic> json) {
    selectedStudents = json['selectedStudents'].cast<String>();
    subjectCode = json['subjectCode'];
    department = json['department'];
    year = json['year'];
    section = json['section'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['selectedStudents'] = this.selectedStudents;
    data['subjectCode'] = this.subjectCode;
    data['department'] = this.department;
    data['year'] = this.year;
    data['section'] = this.section;
    return data;
  }
}
