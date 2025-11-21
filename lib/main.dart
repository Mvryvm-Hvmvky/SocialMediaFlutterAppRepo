import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/providers/bio_provider.dart';
import 'package:social_media_app/providers/login_provider.dart';
import 'package:social_media_app/providers/posts_provider.dart';
import 'package:social_media_app/providers/sign_up_provider.dart';
import 'package:social_media_app/screens/login_screen.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => SignUpProvider(),),
        ChangeNotifierProvider(create: (context) => PostsProvider(),),
        ChangeNotifierProvider(create: (context) => BioProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: LoginScreen()
        ),
    );
  }
}