class LoginModel {
  late bool status;
  late dynamic message;
  late UserLoginData? data;

  LoginModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data']== null? null : UserLoginData.fromJson(json['data']);
  }
}

class UserLoginData {
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;

  UserLoginData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
