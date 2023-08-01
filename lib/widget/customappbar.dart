import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clothing_app/const/color.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget{
  final String appbartitle;
  final String appbartitle2;

  final IconData? aapbaricon;
  final Color? aapbartextcolor;
  final Color? aapbartextcolor2;


  final double? appbarsize;
  final double? appbarsize2;


  appbar ({required this.appbartitle, required this.appbartitle2, this.aapbaricon,  this.aapbartextcolor, this.aapbartextcolor2,   this.appbarsize2,this.appbarsize});

  @override
  Widget build(BuildContext context){
    return AppBar(automaticallyImplyLeading: false,backgroundColor: bgcolor,title: Padding(padding: EdgeInsets.all(1),
        // child: Container(height: 100,width: 400,decoration: BoxDecoration(color: Colors.green),)
        // child: Container(height: 400,width: 400,decoration: BoxDecoration(color: Colors.green),
          child: Column(children:[Padding(padding: EdgeInsets.only(top:10,right: 200),child:Text(appbartitle,style: GoogleFonts.poppins(fontSize: appbarsize,fontWeight: FontWeight.bold,color: aapbartextcolor),),),
                  Row(children: [
                    Padding(padding: EdgeInsets.only(left: 15),child:Text(appbartitle2,style: GoogleFonts.poppins(fontSize: appbarsize2,fontWeight: FontWeight.bold,color: aapbartextcolor2)),),

                    const SizedBox(width: 5,),
                    Padding(padding: (EdgeInsets.only(left: 5)),child:Row(children: [Icon(aapbaricon,size: 30,),],))
                  ])]),
        )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
// leading: aapbaricon!=null? Icon(aapbaricon,color: aapbartextcolor):null,);
