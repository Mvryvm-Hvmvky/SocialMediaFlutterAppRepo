import 'package:dio/dio.dart';
import 'package:social_media_app/models/posts_model.dart';

class PostsService {
  static final Dio dio = Dio();

  static Future<PostsModel> getData() async {
    try {
      Response response = await dio.get(
        "https://socialmediaapi.runasp.net/api/Post",
      );
      return PostsModel.fromJson(response.data);
    } on DioException catch (dioEx) {
      throw Exception(dioEx.message);
    } catch (ex) {
      throw Exception(ex);
    }
  }
    //as long as there is a response (data sent, internet connection availabe, url query/endpoint available) => status code = 200
    //.then((value) =>): can be used instead of async and await in  functions
  static Future<bool> sendData({required String content, required int userId}) async {
    try {
      Response response = await dio.post(
        "https://socialmediaapi.runasp.net/api/Post",
        data: {"content": content.trim(), "userId": userId},
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (ex) {
      return false;
    }
  }
static Future<bool> deleteData({required int postId, required int userId}) async {
    try {
      Response response = await dio.delete(
        "https://socialmediaapi.runasp.net/api/Post/$postId/User/$userId"
      );
      print(response.data);
      return response.statusCode == 200 || response.statusCode == 204;
    } catch (ex) {
      return false;
    }
  }
  
}
