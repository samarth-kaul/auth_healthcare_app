import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = size.height;
    var sWidth = size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Find your desired\nhealth solution",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () {
                        print("bell icon pressed");
                      },
                      icon: const Icon(
                        Icons.notifications_rounded,
                        size: 33,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/Doctor.png"),
                  Image.asset("assets/images/Pharmacy.png"),
                  Image.asset("assets/images/Hospital.png"),
                  Image.asset("assets/images/Ambulance.png"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
