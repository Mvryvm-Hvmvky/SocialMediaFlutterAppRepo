import 'package:flutter/material.dart';
import 'package:social_media_app/models/posts_model.dart';
import 'package:social_media_app/services/posts_service.dart';

class PostsProvider extends ChangeNotifier {
  PostsModel? postsModel;
  Future<void> getData() async {
    postsModel = await PostsService.getData();
    notifyListeners();
  }

  Future<void> sendData({required String content, required int userId}) async {
    var success = await PostsService.sendData(content: content, userId: userId);

    if (success) {
      getData();
      notifyListeners();
    }
  }

  Future<void> deleteData({required int postId, required int userId}) async {
    print("DELETE CALLED with postId: $postId");
    var success = await PostsService.deleteData(postId: postId, userId: userId);

    print("DELETE SUCCESS = $success"); // <--- DEBUG
    if (success) {
      getData();
      notifyListeners();
    }
  }
}
