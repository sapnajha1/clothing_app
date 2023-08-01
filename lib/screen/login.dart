import 'package:clothing_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clothing_app/screen/forgetpassword.dart';
import 'package:clothing_app/screen/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:clothing_app/widget/bottomnavbar.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();


  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? users = userCredential.user;
      print(users!.uid);
      print("login successful");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
    } catch (error) {
      print("An error occured $error");
    }
    if (FirebaseAuth.instance.currentUser != null) {
      print("First Register to use the aap");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(

        body: SingleChildScrollView(child:Column(children: [
          Container(height: 300,width:1000,child: Image.asset("images/twogirl3.jpg",fit: BoxFit.fill,),
          ),

          Container(
              decoration: BoxDecoration(color:Colors.white),
              child:
              Padding(padding:EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                  child:Column(crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Container(height:100,width:300,child:Text("Login",style: GoogleFonts.oswald(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),),),


                      SizedBox(height: 20,),
                      Container(height:50 ,width: 320,child:

                      Row(children:[
                        Icon(Icons.alternate_email,color: Colors.black26),

                        Container(height:40 , width: 290 ,decoration: BoxDecoration(color: Colors.white),
                          child:TextField(   controller: emailcontroller,
                            style: TextStyle(color: Colors.black26),
                            decoration: InputDecoration(hintText: "Email Id",hintStyle: TextStyle(fontSize: 20,color: Colors.black26)),
                          ),),],),),


                      SizedBox(height: 20,),
                      Container(height:50 ,width: 320,child:

                      Row(children:[
                        Icon(Icons.lock_outlined,color: Colors.black26),

                        Container(height:40 , width: 290 ,decoration: BoxDecoration(color: Colors.white),
                          child:TextField( controller: Passwordcontroller
                            ,obscureText: true,style: TextStyle(color: Colors.black26),
                            decoration: InputDecoration(hintText: "Password",hintStyle: TextStyle(fontSize: 20,color: Colors.black26)),
                          ),)])),

                      SizedBox(height: 2,),
                      Padding(padding: EdgeInsets.only(left: 210),
                          child:InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Forget()));},
                            child:Text("Forget Password?",style: GoogleFonts.oswald(color: Colors.indigo,fontSize: 13,fontWeight: FontWeight.bold),) ,)
                      ),

                      SizedBox(height: 40,),
                      InkWell(
                        onTap: () {
                          loginUserWithEmailAndPassword(
                              emailcontroller.text, Passwordcontroller.text);

                        },
                        child: Container(
                          height: 60,
                          width: 180,
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


                      SizedBox(height: 30,),
                      Padding(padding: EdgeInsets.only(left: 5),
                          child:Text("-----------------------OR----------------------",style: TextStyle(color: Colors.black26,fontSize: 15,fontWeight: FontWeight.bold),)),

                      SizedBox(height: 20,),
                      Container(height:40 , width: 320 ,decoration: BoxDecoration(color: Color.fromARGB(
                          255, 209, 211, 224),borderRadius: BorderRadius.circular(50)),
                          child:
                          Padding(padding:EdgeInsets.symmetric(horizontal: 25),child:Row(children: [
                            Image.asset("images/google.png",height: 20,width: 20,),
                            SizedBox(width: 70,),
                            Text("Login with Google",style: GoogleFonts.oswald(color: Colors.black26,fontSize: 15,fontWeight: FontWeight.bold),

                            ),],))),

                      SizedBox(height: 50,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text("Create new account?",style: GoogleFonts.oswald(color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15),),

                          InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));},child:
                          Text("SignUp",style: GoogleFonts.oswald(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),),),

                        ],

                      ),
                       ],)

              )
          ),],),)),);

  }
}
