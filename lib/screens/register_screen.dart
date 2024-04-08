import 'dart:convert';
import 'package:auth_healthcare_app/models/UserRegisterRequest.dart';
import 'package:http/http.dart' as http;
import 'package:auth_healthcare_app/screens/home_screen.dart';
import 'package:auth_healthcare_app/screens/login_screen.dart';
import 'package:auth_healthcare_app/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailCtor = TextEditingController();
  TextEditingController passCtor = TextEditingController();
  TextEditingController nameCtor = TextEditingController();
  bool isChecked = false;
  bool passwordsMatch = false;
  String verificationToken = "";
  bool registerSuccess = false;
  bool isLoading = false;

  // Future<void> _register(String email, String password) async {
  //   final response = await http.post(
  //     Uri.parse('YOUR_LOGIN_API_ENDPOINT'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'email': email,
  //       'password': password,
  //       'confirmPassword': password,
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
  //         SnackBar(content: Text("Registeration Failed: Please try again!")));
  //   }
  // }
  Future<void> _register(email, password) async {
    setState(() {
      isLoading = true;
    });
    UserRegisterRequest user = UserRegisterRequest(
        Email: email, Password: password, ConfirmPassword: password);
    try {
      final response = await http.post(
        Uri.parse('http://10.0.0.72:5490/api/User/register'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Charset': 'utf-8'
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        print(response.body.toString());
        print("Registration successful!");
        verificationToken = response.body.toString();
        registerSuccess = true;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        print("Registration Failed - ${response.statusCode}: ${response.body}");
        registerSuccess = false;
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

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
                    "Register",
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
                          controller: nameCtor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffF3F3F3),
                            labelText: "Name",
                            labelStyle: TextStyle(color: Colors.black38),
                            prefixIcon: const Icon(
                              Icons.person_2_rounded,
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
                        TextFormField(
                          controller: emailCtor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffF3F3F3),
                            labelText: "Email",
                            labelStyle: const TextStyle(color: Colors.black38),
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
                          height: 10,
                        ),
                        TextFormField(
                          controller: passCtor,
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
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              // checkColor: Theme.of(context).primaryColor,
                              activeColor: Theme.of(context).primaryColor,
                              value: isChecked,
                              onChanged: ((value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                            ),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'I agree to the ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Theme.of(context)
                                            .primaryColor, // Green color
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Theme.of(context)
                                            .primaryColor, // Green color
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("register pressed");
                            _register(emailCtor.text, passCtor.text);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            width: double.infinity,
                            child: Center(
                                child: Text(
                              "Register",
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
                              "Already have an account? ",
                              style: TextStyle(color: Colors.black45),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen()));
                              },
                              child: Text(
                                "Login",
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.black12)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/google_svg.svg",
                                height: sHeight * 0.06,
                                width: sWidth * 0.06,
                              ),
                              SizedBox(width: sWidth * 0.06),
                              const Text(
                                "Sign in with Google",
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
                                "assets/fb_svg.svg",
                                height: sHeight * 0.06,
                                width: sWidth * 0.06,
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
                            // mainAxisAlignment: MainAxisAlignment.values,
                            children: [
                              SvgPicture.asset(
                                "assets/apple_svg.svg",
                                height: sHeight * 0.06,
                                width: sWidth * 0.06,
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
