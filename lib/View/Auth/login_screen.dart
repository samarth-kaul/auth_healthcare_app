import 'package:auth_healthcare_app/Utilities/AppColors/app_colors.dart';
import 'package:auth_healthcare_app/Utilities/Components/round_button.dart';
import 'package:auth_healthcare_app/Utilities/Components/sign_in_options_container.dart';
import 'package:auth_healthcare_app/Utilities/Routes/route_names.dart';
import 'package:auth_healthcare_app/Utilities/utils.dart';
import 'package:auth_healthcare_app/View/home_screen.dart';
import 'package:auth_healthcare_app/ViewModel/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCtor = TextEditingController();
  TextEditingController passCtor = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool isLoading = false;

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = size.height;
    var sWidth = size.width;
    if (kDebugMode) {
      print("height of the screen: $sHeight");
      print("width of the screen: $sWidth");
    }
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
                child: const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(
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
                          focusNode: emailFocusNode,
                          controller: emailCtor,
                          onFieldSubmitted: (val) {
                            Utils.fieldFocusChange(
                                context, emailFocusNode, passwordFocusNode);
                          },
                          decoration: Utils.textFieldInputDecor(
                              labelText: "Email",
                              prefixIcon: Icons.email_rounded),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          focusNode: passwordFocusNode,
                          controller: passCtor,
                          obscureText: true,
                          obscuringCharacter: ".",
                          decoration: Utils.textFieldInputDecor(
                            labelText: "Password",
                            prefixIcon: Icons.lock_rounded,
                            suffixIcon: Icons.visibility_rounded,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Spacer(),
                            Text(
                              "Forgot Password?",
                              style: TextStyle(color: AppColors.primaryColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print("login pressed");
                            }
                            if (emailCtor.text.isEmpty ||
                                passCtor.text.isEmpty) {
                              Utils.snackBar(
                                  "Kindly enter your credentials", context);
                            } else if (passCtor.text.length < 6) {
                              Utils.snackBar(
                                  "Password length very small", context);
                            } else {
                              var data = {
                                "Email": emailCtor.text,
                                "Password": passCtor.text
                              };
                              AuthViewModel.loginApi(data, context);
                            }
                          },
                          child: const RoundButton(
                            title: "Login",
                            titleColor: AppColors.whiteColor,
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
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.register);
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Color.fromARGB(115, 160, 136, 136),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Text(
                                "OR",
                                style: TextStyle(
                                    color: Color.fromARGB(115, 160, 136, 136),
                                    fontSize: 20),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Color.fromARGB(115, 160, 136, 136),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            var res = await googleLogin();
                            if (res != null) {
                              Navigator.pushNamed(context, RouteNames.home);
                            } else {
                              Utils.snackBar("Google Sign-in failed", context);
                            }
                          },
                          child: SignInOptionsContainer(
                            sHeight: sHeight,
                            sWidth: sWidth,
                            title: "Login with Google",
                            svgUrl: "assets/google_svg.svg",
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SignInOptionsContainer(
                          sHeight: sHeight,
                          sWidth: sWidth,
                          title: "Login with Facebook",
                          svgUrl: "assets/fb_svg.svg",
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SignInOptionsContainer(
                          sHeight: sHeight,
                          sWidth: sWidth,
                          title: "Login with Apple",
                          svgUrl: "assets/apple_svg.svg",
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






  // Future<void> login(String email, String password) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   UserLoginRequest user = UserLoginRequest(Email: email, Password: password);

  //   try {
  //     final response = await http.post(
  //         Uri.parse("http://10.0.0.72:5490/api/User/login"),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json',
  //           'Charset': 'utf-8'
  //         },
  //         body: jsonEncode(user.toJson()));

  //     if (response.statusCode == 200) {
  //       print(response.body.toString());
  //       print("login successful");
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => const HomeScreen()));
  //     } else {
  //       print("Login Failed - ${response.statusCode}: ${response.body}");
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text("Sign in failed")));
  //     }
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }