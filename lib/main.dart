import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tasks/new/home2.dart';
import 'package:tasks/old/home.dart';
import 'package:tasks/old/singup.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF4762FD),
        hintColor: Color(0xFF4762FD),
        primarySwatch: asd,
      ),
      home: AnimatedSplashScreen(
          duration: 1000,
          splash: "assets/images/opening.png",
          nextScreen: home2(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white),
      routes: {
        "signUp": (context) => singup(),
        "home": (context) => homePage(),
      },
    );
  }
}

const MaterialColor asd = MaterialColor(
  _redPrimaryValue,
  <int, Color>{
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(_redPrimaryValue),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  },
);
const int _redPrimaryValue = 0xFF4762FD;
