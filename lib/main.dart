import 'package:barbera_app/barbera_splash_screen.dart';
import 'package:barbera_app/common/styles/barbera_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbera App',
      debugShowCheckedModeBanner: false,
      theme: BarberaThemes.lightTheme,
      darkTheme: BarberaThemes.darkTheme,
      home: const BarberaSplashScreen(),
    );
  }
}