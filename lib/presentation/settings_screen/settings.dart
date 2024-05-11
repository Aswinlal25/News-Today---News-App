import 'package:flutter/material.dart';
import 'package:my_diary/presentation/utiles/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: kdark,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text('Home Page')]),
    );
  }
}

// Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const SizedBox(
            //         height: 180,
            //       ),
            //       SizedBox(
            //         width: 250,
            //         height: 130,
            //         child: BarProgress(
            //           percentage: 99.0,
            //           backColor: const Color.fromARGB(255, 56, 56, 56),
            //           gradient: const LinearGradient(
            //               colors: [Colors.blue, Colors.blueAccent]),
            //           showPercentage: true,
            //           textStyle:
            //               const TextStyle(color: Colors.white, fontSize: 11),
            //           stroke: 15,
            //           round: true,
            //         ),
            //       ),
            //     ],
            //   ),
            // );



// Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               kheight30,
//               kheight10,
//               Center(
//                 child: Hero(
//                   tag: 'logoDiary',
//                   child: SizedBox(
//                       width: screenSize.width * 0.7,
//                       height: screenSize.height * 0.3,
//                       child: Lottie.asset('assets/animations/akES53GOfx.json',
//                           repeat: true)),
//                 ),
//               ),
//               kheight30,
//               const Text(
//                 ' User Login',
//                 style: TextStyle(
//                   color: Colors.white60,
//                   fontSize: 20,
//                   letterSpacing: 5,
//                   //fontWeight: FontWeight.bold
//                 ),
//               ),
//               kheight5,
//               Container(
//                 width: double.infinity,
//                 height: screenSize.height * 0.27,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: const Color.fromARGB(255, 34, 34, 34)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: Column(children: [
//                     kheight20,
//                     Container(
//                       height: screenSize.height * 0.07,
//                       width: screenSize.width * 0.9,
//                       decoration: const BoxDecoration(
//                         color: kdark,
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                       child: TextFormField(
//                         validator: (val) => val != null && val.isNotEmpty
//                             ? null
//                             : 'Required Field',
//                         decoration: const InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                             borderSide: BorderSide(
//                               color: kblue, // Border color in focused state
//                               width: 2.0,
//                             ),
//                           ),
//                           hintText: 'Email',
//                           hintStyle: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             color: Colors.white60,
//                             letterSpacing: 2,
//                             fontSize: 14,
//                           ),
//                         ),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     kheight20,
//                     Container(
//                       height: screenSize.height * 0.07,
//                       width: screenSize.width * 0.9,
//                       decoration: const BoxDecoration(
//                         color: kdark,
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                       child: TextFormField(
//                         validator: (val) => val != null && val.isNotEmpty
//                             ? null
//                             : 'Required Field',
//                         decoration: const InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                             borderSide: BorderSide(
//                               color: kblue, // Border color in focused state
//                               width: 2.0,
//                             ),
//                           ),
//                           hintText: 'Password',
//                           hintStyle: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             color: Colors.white60,
//                             letterSpacing: 2,
//                             fontSize: 14,
//                           ),
//                         ),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     kheight15,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Already have an account?   ',
//                           style: TextStyle(
//                               color: Colors.white54,
//                               letterSpacing: 1,
//                               fontSize: 13),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => const SignUpScreen()));
//                           },
//                           child: const Text(
//                             'Sign up',
//                             style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15),
//                           ),
//                         )
//                       ],
//                     ),
//                   ]),
//                 ),
//               ),
//               kheight20,
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context, MaterialPageRoute(builder: (_) => HomeScreen()));
              //     NewsApi newsApi = NewsApi();
              //     newsApi.getNews();
              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: kblue,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: SizedBox(
              //       height: screenSize.height * 0.04,
              //       width: double.infinity,
              //       child: Center(
              //         child: Text(
              //           'Login',
              //           style: TextStyle(
              //               fontSize: screenSize.width * 0.04,
              //               color: kwhite,
              //               fontWeight: FontWeight.bold,
              //               letterSpacing: 1),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
//               kheight30,
//               Align(
//                 alignment: Alignment.center,
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: RichText(
//                     text: const TextSpan(children: [
//                       TextSpan(
//                         text: "By continuing, I agree to the ",
//                         style: TextStyle(
//                           color: Colors.white60,
//                           fontSize: 13,
//                           //fontWeight: FontWeight.w300,
//                           letterSpacing: 0.6,
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'Terms of\n         Setvice',
//                         style: TextStyle(
//                             color: kblue,
//                             fontSize: 13,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 0.6,
//                             wordSpacing: 1),
//                       ),
//                       TextSpan(
//                         text: ' and ',
//                         style: TextStyle(
//                             color: Colors.white60,
//                             fontSize: 13,
//                             //  fontWeight: FontWeight.w300,
//                             letterSpacing: 0.6,
//                             wordSpacing: 1),
//                       ),
//                       TextSpan(
//                         text: 'Privacy Policy',
//                         style: TextStyle(
//                             color: kblue,
//                             fontSize: 13,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 0.6,
//                             wordSpacing: 1),
//                       )
//                     ]),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),