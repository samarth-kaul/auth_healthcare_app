import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text("Find your desired health solution"),
              IconButton(
                  onPressed: () {
                    print("bell icon pressed");
                  },
                  icon: Icon(Icons.notifications_rounded))
            ],
          )
        ],
      ),
    );
  }
}
