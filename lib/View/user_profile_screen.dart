import 'package:auth_healthcare_app/View/Splash/onboarding_screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var sHeight = size.height;
    var sWidth = size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Color(0xff42C0B5), Color(0xff4DCBC0)],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: sHeight * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/Heartbeat.svg"),
                            const Row(
                              children: [
                                Text(
                                  "215 ",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "bpm",
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Heart Rate",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                        child: VerticalDivider(
                          color: Color(0xffFFFFFF),
                          thickness: 2,
                          // indent: 600,
                          // endIndent: 600,
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/Fire.svg"),
                            const Row(
                              children: [
                                Text(
                                  "500",
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " cal/day",
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Height",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                        child: VerticalDivider(
                          color: Color(0xffFFFFFF),
                          thickness: 2,
                          // indent: 600,
                          // endIndent: 600,
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/Barbell.svg"),
                            const Row(
                              children: [
                                Text(
                                  "60",
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " kgs",
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Age",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffFBF9F1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/Heart.svg"),
                            SizedBox(
                              width: sWidth * 0.1,
                            ),
                            const Text(
                              "My Profile",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black38,
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/Document.svg"),
                            SizedBox(
                              width: sWidth * 0.1,
                            ),
                            const Text(
                              "My Appointments",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black38,
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/Wallet.svg"),
                            SizedBox(
                              width: sWidth * 0.1,
                            ),
                            const Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black38,
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/Chat.svg"),
                            SizedBox(
                              width: sWidth * 0.1,
                            ),
                            const Text(
                              "FAQs",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black38,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "NO",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const OnboardingLoginSignUp()));
                                      },
                                      child: const Text(
                                        "YES",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                                title: const Text(
                                    "Are you sure you want to logout?"),
                              );
                            },
                          );
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/Danger Circle.svg"),
                              SizedBox(
                                width: sWidth * 0.1,
                              ),
                              const Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black38,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
