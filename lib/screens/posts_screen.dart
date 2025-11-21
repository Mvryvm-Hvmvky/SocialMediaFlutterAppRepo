import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/providers/login_provider.dart';
import 'package:social_media_app/providers/posts_provider.dart';
import 'package:social_media_app/screens/profile_screen.dart';

class PostsScreen extends StatelessWidget {
  final messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      appBar: _appBar(context),
      body: Consumer<PostsProvider>(
        builder: (context, value, child) {
          if (value.postsModel?.posts == null) {
            value.getData();
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formKey,
                      child: Card(child: _messageField()),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await value.sendData(
                            content: messageController.text,
                            userId: loginProvider.loginModel!.user.id,
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                      ),
                      child: Text(
                        "Post",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Consumer<PostsProvider>(
                    builder: (context, value, child) => ListView.builder(
                      reverse: true,
                      itemCount: value.postsModel!.posts.length,
                      itemBuilder: (context, index) {
                        var post = value.postsModel!.posts[index];
                        return Card(
                          color:
                              post.userName ==
                                  loginProvider.loginModel!.user.name
                              ? const Color.fromARGB(255, 215, 214, 214)
                              : Colors.white,
                          child: ListTile(
                            title: Text(post.content),
                            subtitle: Text("By: ${post.userName}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(post.creationDate),
                                if (post.userName ==
                                    loginProvider.loginModel!.user.name)
                                  IconButton(
                                    onPressed: () async {
                                      await value.deleteData(
                                        postId: post.id,
                                        userId:
                                            loginProvider.loginModel!.user.id,
                                      );
                                    },
                                    icon: Icon(Icons.delete, color: Colors.red),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  SizedBox _messageField() {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: messageController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Can't post an empty message";
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          hintText: "Enter your message here...",
          label: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text("Message", style: TextStyle(color: Colors.black)),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Posts",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          ),
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
