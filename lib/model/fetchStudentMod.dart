class fetchStudentMod {
  String? department;
  String? year;
  String? section;

  fetchStudentMod({this.department, this.year, this.section});

  fetchStudentMod.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    year = json['year'];
    section = json['section'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['year'] = this.year;
    data['section'] = this.section;
    return data;
  }
}
