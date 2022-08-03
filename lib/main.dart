import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz_app/screens/auth/login_screen.dart';
import 'package:quiz_app/screens/out_boarding_screen.dart';
import 'package:quiz_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen' : (context)=> const SplashScreen(),
        '/login_screen' : (context)=> const LoginScreen(),
        '/out_boarding_screen':(context)=> const OutBoardingScreen()

      },

    );
  }
}

