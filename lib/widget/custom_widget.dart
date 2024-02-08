
// import 'package:clothing_app/function_services/model_function.dart';
import 'package:clothing_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// Widget frtwid (String text, String name,String brand,String price) {
//   return Text(text,
//     style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),);
// }

Widget bigtxt (String text){
  return Container(padding:EdgeInsets.only(right: 70),child:Text(text,style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.bold,color: aapbartxtcol2),));
}

Widget searchbar (String text,IconData icoon){
  return Padding(padding: EdgeInsets.symmetric(horizontal:30,vertical: 1),child:TextField(decoration: InputDecoration(border: InputBorder.none,icon:
  Icon(Icons.search,color: Colors.black,),
      contentPadding:  EdgeInsets.symmetric(horizontal: 50),
      hintText:text,hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: aapbartxtcol1)
  )));
}

Widget discount (String text, String text2, String text3,text4){
  return Column(children: [Text(text,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),)
    ,Text(text2,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500,color: Color.fromARGB(211, 209, 241, 94)),),
    SizedBox(height: 5,),
    Text(text3,style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white),),
    Text(text4,style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white)



    )]);
}

Widget specialitem (String text){
  return Text(text,style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),);
}
var cont1 = Container(height: 20,width: 20,decoration:BoxDecoration(color:Colors.blue));


Widget normalText(String text,Color color,double textsize){
  return
      Text(text,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),);
}

// Widget userset(String text){
//   return Container(height: 100,width: 200,decoration: BoxDecoration(color: Colors.amberAccent),);
// }

