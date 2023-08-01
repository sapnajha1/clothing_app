import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clothing_app/main.dart';


class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}



class _ForgetState extends State<Forget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      // backgroundColor: Colors.brown,
        body: Column(children: [
          // Padding(padding: EdgeInsets.only(left: 30,top: 30),
          // child:
          Container(height: 300,width:1000,child: Image.asset("images/bluegirl.jpg",fit: BoxFit.fill,),
          ),
          Expanded(child:
          Container(
            height: 100,
            width:double.infinity,
            decoration: BoxDecoration(color:Colors.white),
            child:
            Padding(padding:EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
                  //   children:[
                  //     Text("Sign Up",style: GoogleFonts.oswald(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Text("Forgot",style: GoogleFonts.oswald(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40),),
                      ]),
                  SizedBox(height: 1,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,children:[
                    Text("Password?",style: GoogleFonts.oswald(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40),),
                  ],),

                  SizedBox(height: 30,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Text("Don't worry! It happens. Please enter the",style: GoogleFonts.oswald(color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15),),
                      ]),
                  SizedBox(height: 1,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,children:[
                    Text("address associated with your account.",style: GoogleFonts.oswald(color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 15),),



                  ],),

                  SizedBox(height: 80,),
                  Container(height:50 ,width: 320,child:

                  Row(children:[
                    Icon(Icons.alternate_email,color: Colors.black26),

                    Container(height:40 , width: 290 ,decoration: BoxDecoration(color: Colors.white),
                      child:TextField(style: TextStyle(color: Colors.black26),
                        decoration: InputDecoration(hintText: "Email Id / Mobile number",hintStyle: TextStyle(fontSize: 20,color: Colors.black26)),
                      ),),],),),










                  SizedBox(height: 100,),
                  InkWell(onTap: (){},child: Container(
                    height: 40,width: 320,decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: Colors.indigo ),
                    child: Center(child: Text("Submit",style: GoogleFonts.oswald(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),),

                  ),),







                ] )
            ),),)])));

  }
}
