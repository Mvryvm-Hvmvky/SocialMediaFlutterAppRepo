import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/providers/sign_up_provider.dart';
import 'package:social_media_app/screens/login_screen.dart';
import 'package:social_media_app/widgets/data_field.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
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
                    fieldName: "Name",
                    fieldController: nameController,
                    icon: Icons.person,
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  DataField(
                    fieldName: "Confirm Password",
                    fieldController: confirmPasswordController,
                    icon: Icons.password,
                  ),

                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await signUpProvider.signUp(
                          userName: nameController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                          email: emailController.text,
                        );

                        if (signUpProvider.signUpModel!.status) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                signUpProvider.signUpModel!.message,
                              ),
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    ),
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                    ),
                    child: Text(
                      "Already have an account? Login",
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
        "Sign Up",
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
