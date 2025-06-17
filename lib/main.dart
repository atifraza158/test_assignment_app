import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:test_assignment_app/config/app_colors/app_colors.dart';
import 'package:test_assignment_app/views/auth_views/signin_view/signin_view.dart';
import 'package:test_assignment_app/views/navbar_view/navbar_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppColors.scaffoldBgColor,
      ),
      home: FutureBuilder<User?>(
        future: checkUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
            if (snapshot.data != null) {
              return NavbarView();
            } else {
              return SigninView();
            }
          }
        },
      ),
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> checkUser() async {
    return auth.currentUser;
  }
}
