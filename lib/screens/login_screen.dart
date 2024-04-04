import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Schedule a\ndoctors's appointment",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Image.asset("assets/images/doc-patient.png"),
          ],
        ),
      ),
    );
  }
}
