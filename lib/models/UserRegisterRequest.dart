class UserRegisterRequest {
  final String Email;
  final String Password;
  final String ConfirmPassword;

  UserRegisterRequest(
      {required this.Email,
      required this.Password,
      required this.ConfirmPassword});

  Map<String, dynamic> toJson() {
    return {
      'Email': Email,
      'Password': Password,
      'ConfirmPassword': ConfirmPassword,
    };
  }
}

















// Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//                 controller: _controller,
//                 itemCount: contents.length,
//                 onPageChanged: (int index) {
//                   setState(() {
//                     currentIndex = index;
//                   });
//                 },
//                 itemBuilder: (_, i) {
//                   return Column(children: [
//                     SizedBox(height: sHeight * 0.15),
//                     Image.asset(
//                       contents[i].image,
//                       height: sHeight * 0.55,
//                       // fit: BoxFit.cover,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(20),
//                       height: sHeight * 0.3,
//                       width: double.maxFinite,
//                       decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(40),
//                             topRight: Radius.circular(40),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               spreadRadius: 10,
//                               offset: Offset(7, 7),
//                               blurRadius: 19,
//                             )
//                           ]),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: sHeight * 0.05,
//                           ),
//                           Text(
//                             contents[i].text,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color(0xFF101522),
//                               fontSize: 25,
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           SizedBox(
//                             height: sHeight * 0.05,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 child: Row(
//                                   children: List.generate(
//                                     contents.length,
//                                     (index) => Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: currentIndex == index
//                                             ? const Color(0xff147B72)
//                                             : Colors.grey,
//                                       ),
//                                       height: 10,
//                                       width: currentIndex == index ? 25 : 10,
//                                       margin: const EdgeInsets.only(right: 5),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               FloatingActionButton(
//                                 heroTag: UniqueKey(),
//                                 backgroundColor: const Color(0xff147B72),
//                                 onPressed: () {
//                                   if (currentIndex == contents.length - 1) {
//                                     Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (_) =>
//                                             const OnboardingLoginSignUp(),
//                                       ),
//                                     );
//                                   }
//                                   _controller.nextPage(
//                                     duration: const Duration(milliseconds: 100),
//                                     curve: Curves.bounceIn,
//                                   );
//                                 },
//                                 child: const Icon(
//                                   Icons.arrow_forward_ios_rounded,
//                                   color: Colors.white,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ]);
//                 }),
//           ),
//         ],
//       ),
//     );
