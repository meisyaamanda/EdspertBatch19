import 'package:flutter/material.dart';
import 'package:immersive_boothcamp/presentation/auth/login_screen.dart';
import 'package:immersive_boothcamp/presentation/auth/register_screen.dart';
import 'package:immersive_boothcamp/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

