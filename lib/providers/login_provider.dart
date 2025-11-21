import 'package:flutter/material.dart';
import 'package:social_media_app/models/authentication_model.dart';
import 'package:social_media_app/services/login_service.dart';

class LoginProvider extends ChangeNotifier {
  AuthenticationModel? loginModel;
  Future<void> login({required String password, required String email}) async {
    loginModel = await LoginService.sendData(password: password, email: email);
  }
}