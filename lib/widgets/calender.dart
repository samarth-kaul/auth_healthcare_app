import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  String day;
  String month;
  Calender({required this.month, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day),
          Text(month.toString()),
        ],
      ),
    );
  }
}
