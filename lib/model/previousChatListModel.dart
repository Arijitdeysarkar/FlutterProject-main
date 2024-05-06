class previousChatListModel {
  bool? status;
  List<Result>? result;

  previousChatListModel({this.status, this.result});

  previousChatListModel.fromJson(Map<String, dynamic> json) {
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
  String? senderName;
  String? receiverName;
  String? senderRegistrationNumber;
  String? receiverRegistrationNumber;
  String? receiverId;

  Result(
      {this.senderName,
      this.receiverName,
      this.senderRegistrationNumber,
      this.receiverRegistrationNumber,
      this.receiverId});

  Result.fromJson(Map<String, dynamic> json) {
    senderName = json['senderName'];
    receiverName = json['receiverName'];
    senderRegistrationNumber = json['senderRegistrationNumber'];
    receiverRegistrationNumber = json['receiverRegistrationNumber'];
    receiverId = json['receiverId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['senderName'] = this.senderName;
    data['receiverName'] = this.receiverName;
    data['senderRegistrationNumber'] = this.senderRegistrationNumber;
    data['receiverRegistrationNumber'] = this.receiverRegistrationNumber;
    data['receiverId'] = this.receiverId;
    return data;
  }
}
