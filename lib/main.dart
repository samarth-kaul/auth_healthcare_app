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













// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:home_care/src/presentation/screens/auth/login/login_model.dart';
// import 'package:home_care/src/presentation/screens/auth/login/view_model.dart/login_view_model.dart';

// class LoginView extends ConsumerStatefulWidget {
//   static const routeName = '/login';
//   const LoginView({super.key});

//   @override
//   ConsumerState<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends ConsumerState<LoginView> {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   void dispose() {
//     super.dispose();
//     usernameController.dispose();
//     passwordController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var sHeight = size.height;
//     var sWidth = size.width;

//     final loginViewModel = ref.watch(loginViewModelProvider.notifier);
//     return MaterialApp(
//       home: GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: SafeArea(
//           child: Scaffold(
//             body: Padding(
//               padding: const EdgeInsets.all(16),
//               child: SingleChildScrollView(
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: sHeight * 0.1,
//                     ),
//                     Image.asset("assets/images/flutter_logo.png"),
//                     SizedBox(
//                       height: sHeight * 0.03,
//                     ),
//                     const Text(
//                       "Home Health Care",
//                       style:
//                           TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
//                     ),
//                     SizedBox(
//                       height: sHeight * 0.01,
//                     ),
//                     const Text(
//                       "SIGN IN",
//                       style:
//                           TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
//                     ),
//                     SizedBox(
//                       height: sHeight * 0.02,
//                     ),
                    // TextFormField(
                    //   controller: usernameController,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         vertical: 15.0, horizontal: 20.0),
                    //     filled: true,
                    //     fillColor: Colors.black12,
                    //     labelText: "Login ID",
                    //   ),
                    // ),
//                     SizedBox(
//                       height: sHeight * 0.01,
//                     ),
                    // TextFormField(
                    //   controller: passwordController,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         vertical: 15.0, horizontal: 20.0),
                    //     filled: true,
                    //     fillColor: Colors.black12,
                    //     labelText: "Password",
                    //   ),
                    // ),
//                     SizedBox(
//                       height: sHeight * 0.02,
//                     ),
//                     GestureDetector(
//                       onTap: () async {
//                         String res;
//                         try {
//                           res = await loginViewModel.login(
//                               usernameController.text, passwordController.text);
//                         } catch (e) {
//                           res = e.toString();
//                         }
//                         print(res);
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).primaryColor,
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: Colors.transparent),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: sHeight * 0.01,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         border:
//                             Border.all(color: Theme.of(context).primaryColor),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Forgot Password",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Theme.of(context).primaryColor),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: sHeight * 0.15,
//                     ),
//                     Text(
//                       "Register as Caregiver",
//                       style: TextStyle(
//                           decoration: TextDecoration.underline,
//                           fontSize: 20,
//                           color: Theme.of(context).primaryColor),
//                     ),
//                     SizedBox(
//                       height: sHeight * 0.01,
//                     ),
//                     Text(
//                       "Register as Careseeker",
//                       style: TextStyle(
//                           decoration: TextDecoration.underline,
//                           fontSize: 20,
//                           color: Theme.of(context).primaryColor),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

