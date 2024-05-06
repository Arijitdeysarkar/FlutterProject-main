class getMessageModel {
  List<Result>? result;

  getMessageModel({this.result});

  getMessageModel.fromJson(Map<String, dynamic> json) {
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
  String? message;
  String? senderId;
  String? receiverId;
  String? senderName;
  String? receiverName;
  String? senderRegistrationNumber;
  String? receiverRegistrationNumber;
  String? roomId;
  String? image;
  String? createdAt;
  int? iV;

  Result(
      {this.sId,
      this.message,
      this.senderId,
      this.receiverId,
      this.senderName,
      this.receiverName,
      this.senderRegistrationNumber,
      this.receiverRegistrationNumber,
      this.roomId,
      this.image,
      this.createdAt,
      this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    message = json['message'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    senderName = json['senderName'];
    receiverName = json['receiverName'];
    senderRegistrationNumber = json['senderRegistrationNumber'];
    receiverRegistrationNumber = json['receiverRegistrationNumber'];
    roomId = json['roomId'];
    image = json['image'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['message'] = this.message;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['senderName'] = this.senderName;
    data['receiverName'] = this.receiverName;
    data['senderRegistrationNumber'] = this.senderRegistrationNumber;
    data['receiverRegistrationNumber'] = this.receiverRegistrationNumber;
    data['roomId'] = this.roomId;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
