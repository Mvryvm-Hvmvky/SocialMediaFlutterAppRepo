import 'package:social_media_app/models/user_model.dart';

class AuthenticationModel {
  //since both the sign up and login requests have the same response body, we make a single response model for both
  final bool status;
  final String message;
  final UserModel user;

  AuthenticationModel({
    required this.status,
    required this.message,
    required this.user,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      status: json["status"],
      message: json["message"],
      user: UserModel.fromJson(json["user"]),
    );
  }
}
