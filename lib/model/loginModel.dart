class LoginModel {
  String? registrationNumber;
  String? password;

  LoginModel({this.registrationNumber, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    registrationNumber = json['registrationNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['registrationNumber'] = this.registrationNumber;
    data['password'] = this.password;
    return data;
  }
}
