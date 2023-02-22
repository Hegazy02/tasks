import 'package:flutter/material.dart';
import 'package:tasks/singup.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF4762FD),
        hintColor: Color(0xFF4762FD),
        cardColor: Color(0xFF4762FD),
      ),
      home: singup(),
    );
  }
}
