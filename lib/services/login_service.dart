import 'package:dio/dio.dart';
import 'package:social_media_app/models/authentication_model.dart';

class LoginService {
  static Dio dio = Dio();

  static Future<AuthenticationModel> sendData({
    required String password,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        "https://socialmediaapi.runasp.net/api/Account/Login",
        data: {"password": password, "email": email},
      );
      return AuthenticationModel.fromJson(response.data);
    } on DioException catch (dioEx) {
      throw Exception(dioEx.message);
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
