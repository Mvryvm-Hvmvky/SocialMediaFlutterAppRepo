import 'package:dio/dio.dart';
import 'package:social_media_app/models/authentication_model.dart';

class SignUpService {
  static Dio dio = Dio();

  static Future<AuthenticationModel> sendData({
    required String userName,
    required String password,
    required String confirmPassword,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        "https://socialmediaapi.runasp.net/api/Account/Signup",
        data: {
          "userName": userName,
          "password": password,
          "confirmPassword": confirmPassword,
          "email": email,
        },
      );
      return AuthenticationModel.fromJson(response.data);
    } on DioException catch (dioEx) {
      throw Exception(dioEx.message);
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
