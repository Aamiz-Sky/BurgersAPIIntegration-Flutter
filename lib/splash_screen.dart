import 'package:first_flutter_app/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.orange,Colors.amber],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight)),
        child: Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child: Center(
            child: Image.asset(
            'assets/images/logo.png',
            ),
          ),
        ),
      ),
    );
  }
}
