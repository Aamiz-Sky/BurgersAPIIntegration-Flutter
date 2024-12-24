import 'package:first_flutter_app/login.dart';
import 'package:first_flutter_app/screen/home.dart';
import 'package:first_flutter_app/splash_screen.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginView(),
        '/home': (context) => HomeScreen()
      },
    );
  }
}
