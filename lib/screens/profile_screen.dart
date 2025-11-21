import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/providers/bio_provider.dart';
import 'package:social_media_app/providers/login_provider.dart';

class ProfileScreen extends StatelessWidget {
  final loginController = TextEditingController();
  final bioController = TextEditingController();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);
    var bioProvider = Provider.of<BioProvider>(context);
    if (bioController.text != loginProvider.loginModel!.user.bio) {
      bioController.text = loginProvider.loginModel!.user.bio;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text("Name: "),
              Text(loginProvider.loginModel!.user.name),
            ],
          ),
          Row(
            children: [
              Text("Email: "),
              Text(loginProvider.loginModel!.user.email),
            ],
          ),
          SizedBox(
            height: 300,
            width: 500,
            child: TextField(
              controller: bioController,
              decoration: InputDecoration(
                label: Text("Bio"),
                hintText: "Enter new bio here",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
              maxLines: 5,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await bioProvider.editBio(
                bio: bioController.text,
                userId: loginProvider.loginModel!.user.id,
              );
              if (bioProvider.bioModel!.status == false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(bioProvider.bioModel!.message)),
                );
                
              }
              loginProvider.loginModel!.user.bio = bioController.text;
            },
            
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
