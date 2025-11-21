import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/providers/login_provider.dart';
import 'package:social_media_app/screens/posts_screen.dart';
import 'package:social_media_app/screens/sign_up_screen.dart';
import 'package:social_media_app/widgets/data_field.dart';


class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(listen: false, context);
    return Scaffold(
      appBar: appBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Card(
          color: Colors.white,
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DataField(
                    fieldName: "Email",
                    fieldController: emailController,
                    icon: Icons.email,
                  ),
                  SizedBox(height: 20),
                  DataField(
                    fieldName: "Password",
                    fieldController: passwordController,
                    icon: Icons.password,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () async {
                      await loginProvider.login(
                        password: passwordController.text,
                        email: emailController.text,
                      );
                      if (loginProvider.loginModel?.status == true) {
                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostsScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    ),
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                    ),
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Login",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ),
      centerTitle: true,
    );
  }
}
