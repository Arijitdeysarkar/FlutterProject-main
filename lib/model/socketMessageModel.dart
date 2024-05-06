class socketMessageModel {
  String? sender;
  String? senderId;
  String? message;
  String? room;
  String? createdAt;
  String? image;

  socketMessageModel(
      {this.sender,
      this.senderId,
      this.message,
      this.room,
      this.createdAt,
      this.image});

  socketMessageModel.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    senderId = json['senderId'];
    message = json['message'];
    room = json['room'];
    createdAt = json['createdAt'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['senderId'] = this.senderId;
    data['message'] = this.message;
    data['room'] = this.room;
    data['createdAt'] = this.createdAt;
    data['image'] = this.image;
    return data;
  }
}
