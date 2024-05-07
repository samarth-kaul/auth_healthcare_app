import 'package:auth_healthcare_app/Utilities/Routes/route_names.dart';
import 'package:auth_healthcare_app/Utilities/Routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xff147B72),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff147B72),
        ),
      ),
      initialRoute: RouteNames.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
