class sendMessageMod {
  String? roomId;
  String? senderName;
  String? senderId;
  String? message;
  String? senderRegistrationNumber;
  String? receiverRegistrationNumber;
  String? image;

  sendMessageMod(
      {this.roomId,
      this.senderName,
      this.senderId,
      this.message,
      this.senderRegistrationNumber,
      this.receiverRegistrationNumber,
      this.image});

  sendMessageMod.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    senderName = json['senderName'];
    senderId = json['senderId'];
    message = json['message'];
    senderRegistrationNumber = json['senderRegistrationNumber'];
    receiverRegistrationNumber = json['receiverRegistrationNumber'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomId'] = this.roomId;
    data['senderName'] = this.senderName;
    data['senderId'] = this.senderId;
    data['message'] = this.message;
    data['senderRegistrationNumber'] = this.senderRegistrationNumber;
    data['receiverRegistrationNumber'] = this.receiverRegistrationNumber;
    data['image'] = this.image;
    return data;
  }
}
