import 'package:auth_healthcare_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingLoginSignUp extends StatelessWidget {
  const OnboardingLoginSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/doclogo.png"),
              Text(
                "Let's get started!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Login to enjoy the features we've\nprovided, and stay healthy!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  print("login pressed");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                width: double.infinity,
                child: Center(
                    child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 20),
                )),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(30)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
