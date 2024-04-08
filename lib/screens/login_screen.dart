import 'dart:convert';
import 'package:auth_healthcare_app/models/UserLoginRequest.dart';
import 'package:auth_healthcare_app/screens/home_screen.dart';
import 'package:auth_healthcare_app/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCtor = TextEditingController();
  TextEditingController passCtor = TextEditingController();
  bool isLoading = false;

  // Future<void> _login(String email, String password) async {
  //   final response = await http.post(
  //     Uri.parse('http://10.0.0.72:5490/api/User/login'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'email': email,
  //       'password': password,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     // Successful login
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomeScreen()),
  //     );
  //   } else {
  //     // Failed login
  //     // _showErrorDialog("Login Failed", "Invalid Credentials");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Login Failed: Invalid Credentials")));
  //   }
  // }

  Future<void> login(String email, String password) async {
    setState(() {
      isLoading = true;
    });
    UserLoginRequest user = UserLoginRequest(Email: email, Password: password);

    try {
      print("in try");
      print(email);
      print(password);
      print(user);
      final response = await http.post(
          Uri.parse("http://10.0.0.72:5490/api/User/login"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Charset': 'utf-8'
          },
          body: jsonEncode(user.toJson()));

      if (response.statusCode == 200) {
        print(response.body.toString());
        print("login successful");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        print("Login Failed - ${response.statusCode}: ${response.body}");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Sign in failed")));
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<GoogleSignInAccount?> googleLogin() async {
    print("google sign in pressed");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var result = await _googleSignIn.signIn();

      print("Email: ${result?.email}");
      print("Name: ${result?.displayName}");
      print("ID: ${result?.id}");
      print("Image URL: ${result?.photoUrl}");
      print("Auth Code: ${result?.serverAuthCode}");
      // print(result?._idToken);

      return result;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // void _showErrorDialog(String title, String content) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(title),
  //         content: Text(content),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text("OK"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = size.height;
    var sWidth = size.width;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: isLoading
            ? Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                body: Container(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 30, bottom: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailCtor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffF3F3F3),
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
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passCtor,
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffF3F3F3),
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
                        const SizedBox(
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
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("login pressed");
                            if (emailCtor.text.isEmpty ||
                                passCtor.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Kindly enter your credentials")));
                            } else {
                              login(emailCtor.text, passCtor.text);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            width: double.infinity,
                            child: Center(
                                child: Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(color: Colors.black45),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => RegisterScreen()));
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "OR",
                          style: TextStyle(
                              color: Color.fromARGB(115, 160, 136, 136),
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            var res = await googleLogin();
                            if (res != null) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Google Sign-in failed.")));
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.black12)),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/google_svg.svg",
                                  height: sHeight * 0.05,
                                  width: sWidth * 0.05,
                                ),
                                SizedBox(width: sWidth * 0.06),
                                const Text(
                                  "Sign in with Google",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.black12)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/fb_svg.svg",
                                height: sHeight * 0.05,
                                width: sWidth * 0.05,
                              ),
                              SizedBox(width: sWidth * 0.06),
                              const Text(
                                "Sign in with Facebook",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.black12)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/apple_svg.svg",
                                height: sHeight * 0.05,
                                width: sWidth * 0.05,
                              ),
                              SizedBox(width: sWidth * 0.06),
                              const Text(
                                "Sign in with Apple",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
