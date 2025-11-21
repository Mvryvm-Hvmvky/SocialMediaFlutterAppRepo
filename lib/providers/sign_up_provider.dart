import 'package:flutter/material.dart';
import 'package:social_media_app/models/authentication_model.dart';
import 'package:social_media_app/services/sign_up_service.dart';


class SignUpProvider extends ChangeNotifier {
  AuthenticationModel? signUpModel;
  Future<void> signUp({
    required String userName,
    required String password,
    required String confirmPassword,
    required String email,
  }) async {
    signUpModel = await SignUpService.sendData(
      userName: userName,
      password: password,
      confirmPassword: confirmPassword,
      email: email,
    );
  }
}
