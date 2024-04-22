import 'dart:async';

import 'package:auth_healthcare_app/View/Auth/login_screen.dart';
import 'package:auth_healthcare_app/View/Splash/onboarding_screen1.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
      );
    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/doclogo.png"),
            ],
          ),
        ),
      ),
    );
  }
}

// import "package:auth_healthcare_app/screens/login_screen.dart";
// import "package:flutter/cupertino.dart";
// import "package:flutter/material.dart";
// import "package:lottie/lottie.dart";

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var hgt = size.height;
//     var wdt = size.width;
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("vkjsdvfjksd"),
//                 SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => LoginScreen()));
//                   },
//                   child: Lottie.asset(
//                     "assets/animations/anime_ss.json",
//                     controller: _controller,
//                     height: hgt * 0.4,
//                     width: wdt,
//                     // frameRate: FrameRate.max,
//                     onLoaded: (composition) {
//                       _controller.duration = composition.duration;
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text("vkjsdvfjksd"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
