class SubjectListMod {
  String? department;
  String? year;

  SubjectListMod({this.department, this.year});

  SubjectListMod.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['year'] = this.year;
    return data;
  }
}
