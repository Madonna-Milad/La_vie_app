// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:la_via_app/modules/home_screen.dart';
// import 'package:la_via_app/modules/login_screen.dart';

// import '../shared/components.dart';

// class SignupScreen extends StatelessWidget {
 
  
 

  

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
    

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Align(
//                 alignment: Alignment.topRight,
//                 child: Image.asset(
//                   'assets/images/green.png',
//                   height: height * .18,
//                 )),
//             Image.asset('assets/images/logo.png'),
//             SizedBox(
//               height: height * .05,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 defaultMaterialButton(
//                     buttonName: 'Sign up',
//                     textColor: Theme.of(context).primaryColor,
//                     onPressed: () {}),
//                 SizedBox(
//                   width: width * .125,
//                 ),
//                 defaultMaterialButton(
//                     buttonName: 'Login',
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LoginScreen(),
//                           ));
//                     }),
//               ],
//             ),
//             SizedBox(
//               height: height * .05,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: width * .1),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('First Name'),
//                           defaultTextFormField(
//                               controller: firstNameController,
//                               height: height * .06,
//                               width: width * .37),
//                         ],
//                       ),
//                       SizedBox(
//                         width: width * .03,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Last Name'),
//                           defaultTextFormField(
//                               controller: secondNameController,
//                               height: height * .06,
//                               width: width * .37),
//                         ],
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: height * .02,
//                   ),
//                   Text('Email'),
//                   defaultTextFormField(
//                       controller: emailController, height: height * .06),
//                   SizedBox(
//                     height: height * .02,
//                   ),
//                   Text('Password'),
//                   defaultTextFormField(
//                       controller: passwordController, height: height * .06),
//                   SizedBox(
//                     height: height * .02,
//                   ),
//                   Text('Confirm Password'),
//                   defaultTextFormField(
//                       controller: passwordController, height: height * .06),
//                   SizedBox(
//                     height: height * .03,
//                   ),
//                   defaultButton(
//                       width: width * .78,
//                       height: height * .06,
//                       color: Theme.of(context).primaryColor,
//                       label: 'Sign up',
//                       onPressed: () {
//                         signUp();
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginScreen()));
//                       }),
//                   SizedBox(height: height * .01),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Already have an account ?',
//                         style: TextStyle(color: Colors.grey, fontSize: 13),
//                       ),
//                       SizedBox(
//                         width: width * .02,
//                       ),
//                       TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => LoginScreen(),
//                                 ));
//                           },
//                           child: Text(
//                             'Sign in',
//                             style: TextStyle(
//                                 color: Theme.of(context).primaryColor),
//                           ))
//                     ],
//                   ),
//                   SizedBox(height: height * .02),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         color: Colors.grey,
//                         height: 1,
//                         width: width * .2,
//                       ),
//                       SizedBox(
//                         width: width * .03,
//                       ),
//                       Text('or continue with'),
//                       SizedBox(
//                         width: width * .03,
//                       ),
//                       Container(
//                         color: Colors.grey,
//                         height: 1,
//                         width: width * .2,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: height * .03,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/Google.png'),
//                 SizedBox(
//                   width: width * .06,
//                 ),
//                 Image.asset('assets/images/Facebook.png'),
//               ],
//             ),
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Image.asset('assets/images/green2.png'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
