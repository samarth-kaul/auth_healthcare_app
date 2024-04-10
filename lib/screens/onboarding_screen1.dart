import 'package:auth_healthcare_app/models/onboarding_model.dart';
import 'package:auth_healthcare_app/screens/home_screen.dart';
import 'package:auth_healthcare_app/screens/onboarding_screen2.dart';
import 'package:auth_healthcare_app/widgets/headline.dart';
import 'package:auth_healthcare_app/widgets/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController();
  bool isLastPage = false;

  // @override
  // void initState() {
  //   _controller = PageController(initialPage: 0);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = size.height;
    var sWidth = size.width;
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        pageController.jumpToPage(contents.length - 1);
                      },
                      child: const Text("SKIP")),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: contents.length,
                    onDotClicked: (index) {
                      pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    effect: WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Theme.of(context).primaryColor),
                  ),
                  TextButton(
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: const Text("NEXT"),
                  ),
                ],
              ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                isLastPage = contents.length - 1 == index;
              });
            },
            itemCount: contents.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(contents[index].image),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    contents[index].text,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget getStarted() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnboardingLoginSignUp()));
        },
        child: const Text(
          "Get Started",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
