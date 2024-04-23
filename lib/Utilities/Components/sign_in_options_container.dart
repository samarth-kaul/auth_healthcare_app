// This is basically the container that makes the sign in containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInOptionsContainer extends StatelessWidget {
  const SignInOptionsContainer({
    super.key,
    required this.sHeight,
    required this.sWidth,
    required this.title,
    required this.svgUrl,
  });

  final double sHeight;
  final double sWidth;
  final String title;
  final String svgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            svgUrl,
            height: sHeight * 0.05,
            width: sWidth * 0.05,
          ),
          SizedBox(width: sWidth * 0.06),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
