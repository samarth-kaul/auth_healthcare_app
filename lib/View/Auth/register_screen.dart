import 'package:auth_healthcare_app/Utilities/AppColors/app_colors.dart';
import 'package:auth_healthcare_app/Utilities/Components/round_button.dart';
import 'package:auth_healthcare_app/Utilities/Components/sign_in_options_container.dart';
import 'package:auth_healthcare_app/Utilities/Routes/route_names.dart';
import 'package:auth_healthcare_app/Utilities/utils.dart';
import 'package:auth_healthcare_app/ViewModel/auth_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
                child: const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(
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
                            decoration: Utils.textFieldInputDecor(
                                labelText: "Name",
                                prefixIcon: Icons.person_2_rounded)),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailCtor,
                          decoration: Utils.textFieldInputDecor(
                              labelText: "Email",
                              prefixIcon: Icons.email_rounded),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passCtor,
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: Utils.textFieldInputDecor(
                              labelText: "Password",
                              suffixIcon: Icons.visibility,
                              prefixIcon: Icons.lock_rounded),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: AppColors.primaryColor,
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
                                    const TextSpan(
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
                            if (kDebugMode) {
                              print("register pressed");
                            }
                            if (emailCtor.text.isEmpty ||
                                nameCtor.text.isEmpty ||
                                passCtor.text.isEmpty) {
                              Utils.snackBar(
                                  "Kindly enter your credentials carefully",
                                  context);
                            } else if (passCtor.text.length < 6) {
                              Utils.snackBar(
                                  "Password length very small", context);
                            } else {
                              Map data = {
                                "Email": emailCtor.text,
                                "Password": passCtor.text,
                                "ConfirmPassword": passCtor.text,
                              };
                              AuthViewModel.registerApi(data, context);
                            }
                          },
                          child: const RoundButton(
                              title: "Register",
                              titleColor: AppColors.whiteColor),
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
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.login);
                              },
                              child: const Text(
                                "Login",
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
                        SignInOptionsContainer(
                            sHeight: sHeight,
                            sWidth: sWidth,
                            title: "Sign-in with Google",
                            svgUrl: "assets/google_svg.svg"),
                        const SizedBox(
                          height: 4,
                        ),
                        SignInOptionsContainer(
                            sHeight: sHeight,
                            sWidth: sWidth,
                            title: "Sign-in with Facebook",
                            svgUrl: "assets/fb_svg.svg"),
                        const SizedBox(
                          height: 4,
                        ),
                        SignInOptionsContainer(
                            sHeight: sHeight,
                            sWidth: sWidth,
                            title: "Sign-in with Apple",
                            svgUrl: "assets/apple_svg.svg"),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}





  // Future<void> _register(email, password) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   UserRegisterRequest user = UserRegisterRequest(
  //       Email: email, Password: password, ConfirmPassword: password);
  //   try {
  //     final response = await http.post(
  //       Uri.parse('http://10.0.0.72:5490/api/User/register'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //         'Charset': 'utf-8'
  //       },
  //       body: jsonEncode(user.toJson()),
  //     );

  //     if (response.statusCode == 200) {
  //       print(response.body.toString());
  //       print("Registration successful!");
  //       verificationToken = response.body.toString();
  //       registerSuccess = true;
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => const HomeScreen()));
  //     } else {
  //       print("Registration Failed - ${response.statusCode}: ${response.body}");
  //       registerSuccess = false;
  //     }
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

