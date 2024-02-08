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
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } catch (error) {
      print("An error occurred $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: Image.asset("images/twogirl5.jpg", fit: BoxFit.cover),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign Up", style: GoogleFonts.oswald(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          controller: emailcontroller,
                          style: TextStyle(color: Colors.black26),
                          decoration: InputDecoration(
                            hintText: "Email Id",
                            hintStyle: TextStyle(fontSize: 20, color: Colors.black26),
                            prefixIcon: Icon(Icons.alternate_email, color: Colors.black26),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          controller: Passwordcontroller,
                          obscureText: true,
                          style: TextStyle(color: Colors.black26),
                          decoration: InputDecoration(
                            hintText: "Create Password",
                            hintStyle: TextStyle(fontSize: 20, color: Colors.black26),
                            prefixIcon: Icon(Icons.lock_outlined, color: Colors.black26),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("By signing up, you're agree with our", style: GoogleFonts.oswald(color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 12)),
                          TextButton(
                            onPressed: () {},
                            child: Text("Terms & Conditions", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                          // SizedBox(height: 5,),
                          // Text("and", style: GoogleFonts.oswald(color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 12)),
                          // TextButton(
                          //   onPressed: () {},
                          //   child: Text("Privacy Policy", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
                          // ),
                        ],
                      ),

                      // SizedBox(height: 2,),
                      Row(
                        children: [
                          Text("and", style: GoogleFonts.oswald(color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 12)),
                          TextButton(
                            onPressed: () {},
                            child: Text("Privacy Policy", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Join us before?", style: GoogleFonts.oswald(color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 15)),
                          InkWell(
                            onTap: () {
                              createUserWithEmailAndPassword(emailcontroller.text, Passwordcontroller.text);
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
                              child: Center(child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
