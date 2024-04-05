import 'package:auth_healthcare_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = size.height;
    var sWidth = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black38),
                    prefixIcon: const Icon(
                      Icons.email_rounded,
                      color: Colors.black38,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.black38),
                    prefixIcon: const Icon(
                      Icons.lock_rounded,
                      color: Colors.black38,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          // width: double.maxFinite,
                          ),
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    print("login pressed");
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black45),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "OR",
                  style: TextStyle(
                      color: const Color.fromARGB(115, 160, 136, 136),
                      fontSize: 20),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/google_svg.svg"),
                      SizedBox(width: sWidth * 0.03),
                      Text("Sign in with Google"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/apple_svg.svg"),
                      SizedBox(width: sWidth * 0.03),
                      Text("Sign in with Apple"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/fb_svg.svg"),
                      SizedBox(width: sWidth * 0.03),
                      Text("Sign in with Facebook"),
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
