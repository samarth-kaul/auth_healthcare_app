import 'package:auth_healthcare_app/widgets/headline.dart';
import 'package:auth_healthcare_app/screens/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/doc-patient.png"),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Consult with a doctor you trust",
                    style: TextStyle(
                      color: Color(0xFF101522),
                      fontSize: 22,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0.06,
                    ),
                  ),
                ),
              ),
            ),
            // Imagee(),
            // Headline(),
            // Text(
            //   "Consult only with a doctor you trust",
            //   style: TextStyle(
            //     color: Color(0xFF101522),
            //     fontSize: 22,
            //     fontFamily: 'Inter',
            //     fontWeight: FontWeight.w700,
            //     height: 0.06,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
