import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clothing_app/screen/login.dart';
import 'package:clothing_app/main.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final emailcontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? users = userCredential.user;
      print(users!.uid);
      print("User Registered");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
    } catch (error) {
      print("An error occured $error");
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(child:Scaffold(
      // backgroundColor: Colors.brown,
        body:SingleChildScrollView(child: Column(children: [

          Container(height: 300,width:1000,child: Image.asset("images/twogirl5.jpg",fit: BoxFit.fill,),
          ),

          Container(
            // height: 100,
            // width:double.infinity,
              decoration: BoxDecoration(color:Colors.white),
              child:
              Padding(padding:EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                  child:Column(crossAxisAlignment:CrossAxisAlignment.start,
                    children:[
                      Text("Sign Up",style: GoogleFonts.oswald(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),),


                      SizedBox(height: 20,),
                      Container(height:50 ,width: 320,child:

                      Row(children:[
                        Icon(Icons.alternate_email,color: Colors.black26),

                        Container(height:40 , width: 290 ,decoration: BoxDecoration(color: Colors.white),
                          child:TextField(      controller: emailcontroller,style: TextStyle(color: Colors.black26),
                            decoration: InputDecoration(hintText: "Email Id",hintStyle: TextStyle(fontSize: 20,color: Colors.black26)),
                          ),),],),),


                      SizedBox(height: 20,),
                      Container(height:50 ,width: 320,child:

                      Row(children:[
                        Icon(Icons.call,color: Colors.black26),

                        Container(height:40 , width: 290 ,decoration: BoxDecoration(color: Colors.white),
                          child:TextField( controller: Passwordcontroller,style: TextStyle(color: Colors.black26),
                            decoration: InputDecoration(hintText: "Create Password",hintStyle: TextStyle(fontSize: 20,color: Colors.black26)),
                          ),)])),



                      SizedBox(height: 30,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text("By singing up, you're agree with our",style: GoogleFonts.oswald(color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 12),),
                            Text("Terms & Conditions",style: GoogleFonts.oswald(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 12),),]),
                      SizedBox(height: 1,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,children:[
                        Text("and",style: GoogleFonts.oswald(color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 12),),
                        Text("Privacy Policy",style: GoogleFonts.oswald(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 12),),


                      ],),
                      // SizedBox(height: 40,),

                      SizedBox(height: 50,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text("Join us before?",style: GoogleFonts.oswald(color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15),),
                          InkWell(
                            onTap: () {
                              createUserWithEmailAndPassword(
                                  emailcontroller.text, Passwordcontroller.text);
                              // Navigator.push(
                              //   context,
                              //   PageTransition(
                              //     curve: Curves.bounceOut,
                              //     type: PageTransitionType.rotate,
                              //     alignment: Alignment.topCenter,
                              //     child: LoginPage(),
                              //   ),
                              // );
                            },
                            child: Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.blue),
                              child: const Center(
                                child: Text("Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )),
                              ),
                            ),
                          ),

                          // InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));},child:
                          // Text("Login",style: GoogleFonts.oswald(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),),),
                        ],

                      ),



                    ],)

              )
          ),]))));

  }
}
