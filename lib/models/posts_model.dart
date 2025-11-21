import 'package:social_media_app/models/post_model.dart';

class PostsModel {
  List<PostModel> posts;
  PostsModel({required this.posts});
  factory PostsModel.fromJson(Map<String, dynamic> json) {
    List<PostModel> temp = json["results"] == null
        ? []
        : json["results"]
              .map<PostModel>(
                (post) => PostModel(
                  id: post["id"] ?? -1,
                  content: post["content"] ?? 'Unknown',
                  creationDate: post["createdAt"] ?? 'Unknown',
                  userName: post["userName"] ?? 'Unknown',
                ),
              )
              .toList();
    return PostsModel(posts: temp);
  }
}
