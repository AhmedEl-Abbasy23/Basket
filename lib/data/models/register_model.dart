class RegisterModel {
  late bool status;
  late dynamic message;
  late UserRegisterData? data;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data']== null? null : UserRegisterData.fromJson(json['data']);
  }
}

class UserRegisterData {
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;

  UserRegisterData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
