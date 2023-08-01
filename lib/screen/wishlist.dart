import 'package:clothing_app/const/color.dart';
import 'package:clothing_app/gridview.dart';
import 'package:flutter/material.dart';
import 'package:clothing_app/widget/custom_widget.dart';
import 'package:google_fonts/google_fonts.dart';


class Heart extends StatelessWidget {
  // const Heart({Key? key}) : super(key: key);


  // var arr1=[cont1,cont1,cont1,cont1,cont1,cont1,cont1,cont1,cont1,cont1];
  final item;

  Heart({required this.item});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0,right: 18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Padding(padding: EdgeInsets.only(top: 60,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back_ios,size: 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite,color: Colors.red,size: 30,),

                  SizedBox(width: 13,),
                  Icon(Icons.share,size: 30),

                  SizedBox(width: 13,),
                  Badge(
                    label: Text('1'),
                    child: Icon(Icons.shopping_bag_outlined,size: 30),
                  )
                ],
              )
            ],
          ),),

          SizedBox(height: 25,),
          Container(height: 400,width: 400 ,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(item.img))),),

          SizedBox(height: 40,),
          Row(children: [Text("Essentials Women's Grey Top ",style: GoogleFonts.poppins(
            fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black
          ),),]),

            SizedBox(height: 14,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.star,color: Colors.orange,),
              Text("4.9 Ratings",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,fontSize: 15),),

              Text("2.3k+ Reviews",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,fontSize: 15)),
              Text("2.9k+ Sold",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,fontSize: 15))

            ],),

            SizedBox(height: 30,),
            const Row(children: [
              Text("About Items",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),

              SizedBox(width: 150,),
              Text("Reviews",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),

            ],),

            Divider(color: Colors.black,),


            SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.only(left: 2,right: 5),
              child: Row(
                children: [
                  Row(children: [
                    Text("Brand:",style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.grey,fontSize: 18),),

                    SizedBox(width: 7,),
                    Text("Lara",style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.black54,fontSize: 16),),
                  ],),

                  SizedBox(width: 150,),


                  Row(children: [Text("Color:",style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.grey,fontSize: 18),),
                    SizedBox(width: 12,),

                    Text("Grey",style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.black54,fontSize: 16),)],)
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Total Price"),
                          Text("\₹230",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.blueAccent),)
                        ],
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Container(height: 50,width: 70,
                      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(7),
                        topLeft: Radius.circular(7)
                      )),

                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.shopping_basket_outlined,color: Colors.white,),
                                Text("1",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(height: 50,width: 120,decoration: BoxDecoration(
                        color: Colors.black,borderRadius: BorderRadius.only(bottomRight:
                      Radius.circular(7),topRight: Radius.circular(7))
                      ) ,

                        child: Center(child:
                          Text("Buy Now",style: TextStyle(color: Colors.white,fontSize: 17),),),
                      )

                    ],
                  ),

                ],
            )
            )],
        ),


      )



    );
  }
}
