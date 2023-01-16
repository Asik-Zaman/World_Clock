import 'package:clock_world/Pages/homepage.dart';
import 'package:clock_world/Pages/loading.dart';
import 'package:clock_world/Pages/location.dart';
import 'package:clock_world/Pages/ninja_homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/location': (context) => Location(),
        '/home': (context) => NinjaHomePage(),
      },
    );
  }
}
