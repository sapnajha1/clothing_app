// import 'dart:js';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../const/color.dart';
// import 'desktop.dart';
// import 'forgetpassword.dart';
//
// class LoginPage extends StatefulWidget {
//   final void Function(String email, String password) onSubmit;
//   final void Function() onForgotPassword;
//
//   LoginPage({required this.onSubmit, required this.onForgotPassword});
//
//   @override
//   State<LoginPage> createState() => LoginPageState();
// }
//
// class LoginPageState extends State<LoginPage> {
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController email_ctrl = TextEditingController();
//   TextEditingController password_ctrl = TextEditingController();
//   // RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');
//   RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$#!%*?&])[A-Za-z\d@$#!%*?&]{6,}$');
//   RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//
//
//   void _submitForm(BuildContext context) {
//     if (_formKey.currentState!.validate()) {
//       // Form is valid, proceed with form submission
//       widget.onSubmit(email_ctrl.text, password_ctrl.text);
//
//       // After successful form submission, navigate to the DesktopPage
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DesktopPage(title: 'desktoppage'),
//         ),
//       );
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     var mq = MediaQuery.of(context).size;
//     return Scaffold(
//         padding: const EdgeInsets.only(left: 350),
//         child: Container(
//           height: mq.height * 0.980,
//           width: mq.width * 0.300,
//           decoration: BoxDecoration(color: unique),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       height: mq.height * 0.680,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(20),
//                           bottomRight: Radius.circular(20),
//                         ),
//                         color: Colors.lightGreen,
//                       ),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(25.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   height: 25,
//                                   width: 50,
//                                   child: Image.asset("images/new.png"),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 55,),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Welcome back!", style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
//                               SizedBox(height: 10),
//                               Text("Sign in with your email and password", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
//                               SizedBox(height: 4.0,),
//                               Text("or social media to continue", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
//                             ],
//                           ),
//                           SizedBox(height: 30.0,),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 15),
//                             child: Container(
//                               decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.1), borderRadius: BorderRadius.circular(40)),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                                 child: TextFormField(
//                                   controller: email_ctrl,
//                                   style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     labelText: "Email",
//                                     hintText: "Enter your email",
//                                   ),
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Email is required';
//                                     }
//                                     if (!value.contains('@')) {
//                                       return 'Invalid email format';
//                                     }
//                                     if (!emailRegex.hasMatch(value)) {
//                                       return 'Write a strong password';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 20,),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 15),
//                             child: Container(
//                               decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.1), borderRadius: BorderRadius.circular(40)),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                                 child: TextFormField(
//                                   controller: password_ctrl,
//                                   style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold,),
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     labelText: "Password",
//                                     hintText: "Enter your Password",
//                                     suffix: Icon(Icons.remove_red_eye_outlined),
//                                   ),
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Password is required';
//                                     }
//                                     if (value!.length < 6) {
//                                       return 'Password must be at least 6 characters long';
//                                     }
//                                     if (!passwordRegex.hasMatch(value)) {
//                                       return 'Write a strong password';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           SizedBox(height: 10,),
//                           Padding(
//                             padding: EdgeInsets.only(left: 210),
//                             child: InkWell(
//                               // onTap: widget.onForgotPassword,
//                               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));},
//                               child: Text("Forget Password?", style: GoogleFonts.oswald(color: Color(0xFAFAF266), fontSize: 15, fontWeight: FontWeight.bold),),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 430, left: 160),
//                       child: InkWell(
//                         onTap: () => _submitForm(context),
//                         child: Container(
//                           height: 35,
//                           width: 100,
//                           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
//                           child: Center(
//                             child: Text("Submit", style: GoogleFonts.poppins(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 30,),
//                 Center(child: Text(" * Or continued with * ", style: TextStyle(fontSize: 17, color: Colors.black),)),
//                 SizedBox(height: 30,),
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 140),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 35,
//                           width: 35,
//                           child: Image.asset("images/google.png", fit: BoxFit.fill),
//                         ),
//                         SizedBox(width: 30,),
//                         Container(
//                           height: 35,
//                           width: 35,
//                           child: Image.asset("images/facebook.png", fit: BoxFit.fill),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30,),
//                 Center(
//                   child: Column(
//                     children: [
//                       Text("By continued you confirm that you agree with", style: TextStyle(fontSize: 10, color: Colors.black),),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text("Our", style: TextStyle(fontSize: 16, color: Colors.black),),
//                           SizedBox(width: 2,),
//                           Text("Terms & Condition", style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// //
// // class MyOtherPage extends StatelessWidget {
// //   void _submitForm(String email, String password) {
// //     // Implement the login logic here
// //     // Use the email and password for authentication
// //     Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>DesktopPage(title: 'desktop')));
// //   }
// //
// //   void _forgotPassword() {
// //     // Navigate to the forgot password page or any other action needed
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('My Other Page'),
// //       ),
// //       body: LoginPage(
// //         onSubmit: _submitForm,
// //         onForgotPassword: _forgotPassword,
// //       ),
// //     );
// //   }}