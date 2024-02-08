import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clothing_app/screen/forgetpassword.dart';
import 'package:clothing_app/screen/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:clothing_app/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      print(user!.uid);
      print("Login successful");
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: Image.asset(
                  "images/twogirl3.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.oswald(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alternate_email, color: Colors.black26),
                        hintText: "Email Id",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.black26),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outlined, color: Colors.black26),
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.black26),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Forget()));
                        },
                        child: Text(
                          "Forget Password?",
                          style: GoogleFonts.oswald(color: Colors.indigo, fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        loginUserWithEmailAndPassword(emailController.text, passwordController.text);
                      },
                      child: Text("Login"),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Image.asset("images/google.png", height: 20, width: 20),
                      label: Text("Login with Google"),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 209, 211, 224),
                        primary: Colors.black26,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.symmetric(horizontal: 25),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Create new account?"),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                          },
                          child: Text("SignUp", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
