import 'package:clothing_app/screen/home.dart';
import 'package:clothing_app/screen/login.dart';
import 'package:clothing_app/screen/signup.dart';
import 'package:clothing_app/screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clothing_app/widget/customappbar.dart';
import 'package:clothing_app/const/color.dart';
import 'package:flutter/widgets.dart';
import 'package:clothing_app/widget/bottomnavbar.dart';
import 'package:clothing_app/screen/cart.dart';
import 'package:clothing_app/screen/wishlist.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';




void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:splash(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int selectedindex=0;
  // var arr1=[cont1,cont1,cont1,cont1,cont1,cont1];
  // var screens = [house(),model_home(),Heart()];
  // void onitemtapped(int index){
  //   setState((){
  //       selectedindex=index;
  //   });
  // }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: appbar(appbartitle: "Hi Sapna",appbartitle2: "What is Your Outfit Today?",
        //   aapbaricon: Icons.circle_notifications_rounded,aapbartextcolor:aapbartxtcol1,aapbartextcolor2: aapbartxtcol2 ,appbarsize: 17,appbarsize2: 19,
        // ),
        backgroundColor: themecol,

        body:bottomnav(),
    );

  }
}
