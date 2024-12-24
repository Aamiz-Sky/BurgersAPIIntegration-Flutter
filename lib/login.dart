import 'package:first_flutter_app/screen/home.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.orange, Colors.amber],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          )
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2,
                    right: 8,
                    left: 8,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Column(
                    children: [
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (usernameController.text == "aamiz" &&
                                    passwordController.text == "aamiz") {
                                  Navigator.pushNamed(context, '/home');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Invalid Username or Password"),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 25),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange, // Button color
                                foregroundColor: Colors.black, // Text color
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
