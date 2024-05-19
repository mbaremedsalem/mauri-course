
class LoginModel
{
  String? message;
  int?status;
  String?role;
  String? access;
  // ignore: non_constant_identifier_names
  String? refresh_token;

  LoginModel.fromJason(Map<String,dynamic> json)
  {
    message = json['message'];
    status = json['status'];
    role = json['role'];
    access = json['access'];
    refresh_token = json['refresh_token'];

  }
}






















