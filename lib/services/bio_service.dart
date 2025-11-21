import 'package:dio/dio.dart';
import 'package:social_media_app/models/bio_model.dart';


class BioService {
  static Dio dio = Dio();
  static Future<BioModel> editBio({required String bio, required int userId}) async {
    try {
      Response response = await dio.put(
        "https://socialmediaapi.runasp.net/api/User/$userId",
        data: {"bio": bio},
      );
      return BioModel.fromJson(response.data);
    } on DioException catch (dioEx) {
      throw Exception(dioEx.message);
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
