import 'package:auth_healthcare_app/models/onboarding_model.dart';
import 'package:auth_healthcare_app/screens/home_screen.dart';
import 'package:auth_healthcare_app/screens/onboarding_screen2.dart';
import 'package:auth_healthcare_app/widgets/headline.dart';
import 'package:auth_healthcare_app/widgets/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = size.height;
    var sWidth = size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(children: [
                    Expanded(
                      child: Image.asset(
                        contents[i].image,
                        // height: sHeight * 0.7,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      // height: sHeight * 0.3,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 10,
                              offset: Offset(5, 5),
                              blurRadius: 10,
                            )
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            contents[i].text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF101522),
                              fontSize: 25,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: List.generate(
                                    contents.length,
                                    (index) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: currentIndex == index
                                            ? const Color(0xff147B72)
                                            : Colors.grey,
                                      ),
                                      height: 10,
                                      width: currentIndex == index ? 25 : 10,
                                      margin: const EdgeInsets.only(right: 5),
                                    ),
                                  ),
                                ),
                              ),
                              FloatingActionButton(
                                backgroundColor: const Color(0xff147B72),
                                onPressed: () {
                                  if (currentIndex == contents.length - 1) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const OnboardingLoginSignUp(),
                                      ),
                                    );
                                  }
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 150),
                                    curve: Curves.bounceIn,
                                  );
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]);
                }),
          ),
        ],
      ),
    );
  }
}




// // Expanded(
// //                 child: Container(
// //                   decoration: const BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.only(
// //                       topLeft: Radius.circular(40),
// //                       topRight: Radius.circular(40),
// //                     ),
// //                   ),
// //                   child: const Center(
// //                     child: Text(
// //                       "Consult with a doctor you trust",
// //                       style: TextStyle(
// //                         color: Color(0xFF101522),
// //                         fontSize: 25,
// //                         fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w700,
// //                         height: 0.06,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: 
// Column(
//             children: [
//               Image.asset(
//                 "assets/images/doc-patient.png",
//                 height: sHeight * 0.7,
//               ),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 height: sHeight * 0.3,
//                 width: double.maxFinite,
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40),
//                       topRight: Radius.circular(40),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey,
//                         spreadRadius: 10,
//                         offset: Offset(5, 5),
//                         blurRadius: 10,
//                       )
//                     ]),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 100,
//                     ),
//                     const Text(
//                       "Consult with a doctor you trust",
//                       style: TextStyle(
//                         color: Color(0xFF101522),
//                         fontSize: 25,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         height: 0.06,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 60,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           child: Row(
//                             children: List.generate(
//                               3,
//                               (index) => Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Color(0xff147B72),
//                                 ),
//                                 height: 10,
//                                 width: 10,
//                                 margin: const EdgeInsets.only(right: 5),
//                               ),
//                             ),
//                           ),
//                         ),
//                         FloatingActionButton(
//                           onPressed: () {},
//                           child: const Icon(Icons.arrow_forward_ios_rounded),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),


// //               // Imagee(),
// //               // Headline(),
// //               // Text(
// //               //   "Consult only with a doctor you trust",
// //               //   style: TextStyle(
// //               //     color: Color(0xFF101522),
// //               //     fontSize: 22,
// //               //     fontFamily: 'Inter',
// //               //     fontWeight: FontWeight.w700,
// //               //     height: 0.06,
// //               //   ),
// //               // ),
// //             ],
// //           ),
// //         ),
// //       ),
//     );