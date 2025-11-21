import 'package:dio/dio.dart';
import 'package:social_media_app/models/posts_model.dart';

class PostsService {
  static final Dio _dio = Dio();
  static final String _baseUrl = "https://socialmediaapi.runasp.net/api/Post";
  static Future<PostsModel> getData() async {
    try {
      Response response = await _dio.get(_baseUrl);
      return PostsModel.fromJson(response.data);
    } on DioException catch (dioEx) {
      throw Exception(dioEx.message);
    } catch (ex) {
      throw Exception(ex);
    }
  }

  //as long as there is a response (data sent, internet connection availabe, url query/endpoint available) => status code = 200
  //.then((value) =>): can be used instead of async and await in  functions
  static Future<bool> sendData({
    required String content,
    required int userId,
  }) async {
    try {
      Response response = await _dio.post(
        _baseUrl,
        data: {"content": content.trim(), "userId": userId},
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (ex) {
      return false;
    }
  }

  static Future<bool> deleteData({
    required int postId,
    required int userId,
  }) async {
    try {
      Response response = await _dio.delete("$_baseUrl/$postId/User/$userId");
      print(response.data);
      return response.statusCode == 200 || response.statusCode == 204;
    } catch (ex) {
      return false;
    }
  }
}
