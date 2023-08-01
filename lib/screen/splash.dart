import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'dart:async';
import 'package:clothing_app/screen/login.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:(context) => LoginPage(),
          ));
    });
  }




  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset("images/splash1.png",width: 50,height: 30 ,),
        nextScreen: LoginPage(),
        splashTransition: SplashTransition.slideTransition,
        backgroundColor:Colors. grey,
      ),
    );
  }
}


// class splash_screen extends StatefulWidget {
//   const splash_screen({Key? key}) : super(key: key);
//
//   @override
//   State<splash_screen> createState() => _splash_screenState();
// }
//
// class _splash_screenState extends State<splash_screen> {
//
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 5), () {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder:(context) => Login(),
//           ));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.blueGrey,
//         child:Center(child: Text("MXPLAYER",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
//         ),
//       ),
//     );
//   }
// }
