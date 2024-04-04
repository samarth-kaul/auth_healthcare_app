import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 288,
          child: Text(
            'Consult only with a doctor you trust',
            style: TextStyle(
              color: Color(0xFF101522),
              fontSize: 22,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0.06,
            ),
          ),
        ),
      ],
    );
  }
}
