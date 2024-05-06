class getAllExamModel {
  bool? status;
  List<Result>? result;

  getAllExamModel({this.status, this.result});

  getAllExamModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
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

class Result {
  String? sId;
  String? exam;
  int? fees;
  String? date;

  Result({this.sId, this.exam, this.fees, this.date});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    exam = json['exam'];
    fees = json['fees'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['exam'] = this.exam;
    data['fees'] = this.fees;
    data['date'] = this.date;
    return data;
  }
}
