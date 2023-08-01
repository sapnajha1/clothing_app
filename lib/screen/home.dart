import 'package:clothing_app/screen/wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clothing_app/widget/custom_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clothing_app/const/color.dart';
import 'package:flutter/widgets.dart';
import 'package:clothing_app/widget/customappbar.dart';

import '../function_services/model_function.dart';
import '../model/item_model.dart';
import '../model/model.dart';
import 'dashboard/detailpage.dart';




class house extends StatefulWidget {
  const house({super.key});



  @override
  State<house> createState() => _houseState();
}

class _houseState extends State<house> {

  var arr1=[cont1,cont1,cont1,cont1,cont1,cont1];
  // final List<Product> _items=[];


  // @override
  // void initState(){
  //   super.initState();
  //
  //   gridview(Product _items);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: bgcolor,

        // appBar: appbar(appbartitle: "Hi Sapna",appbartitle2: "What is Your Outfit Today?",
        //   aapbaricon: Icons.circle_notifications_rounded,aapbartextcolor:aapbartxtcol1,aapbartextcolor2: aapbartxtcol2 ,appbarsize: 17,appbarsize2: 19,
        // ),
      body :SingleChildScrollView(
        child: SafeArea(child:Column(children:[

          Padding(padding: EdgeInsets.all(20,),

            child: Column(crossAxisAlignment: CrossAxisAlignment.start,

              children:[Container(height: 150,width: 420,child:

               Column(crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text("Hi Sapna",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 2,),

                  Row(
                    children: [
                      Text("What is Your Outfit Today?",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold),),

                      SizedBox(width: 40,),
                      Icon(Icons.circle_notifications_rounded),
                    ],
                  ),
                ],
              )),

                Container(height: 40,width: 400,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white,boxShadow: [BoxShadow(color: Colors.lightBlue.withOpacity(0.84),),]),
                  child: searchbar("Search product",Icons.abc),),

                SizedBox(height: 30,),
                Stack(children: [Container(height: 200,width: 500,decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(40)),
                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                        child:discount("Last Discount","Up to 70%","Shop Now & Get Free","shipping to your House")),
                      ClipRRect(child:Image.asset("images/priya.jpg",width:150,height: 200,fit: BoxFit.fill,),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(32),topRight: Radius.circular(32)),),])),
                ],),

                SizedBox(height: 20,),
                Row(
                  children: [
                    specialitem("Special Items"),

                    SizedBox(width: 90,),
                    Text("See more",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue),)
                  ],
                ),

              //,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

              SizedBox(width: 90,),
               Padding(padding: EdgeInsets.all(1.0),
                    child:grid()),
       ]))
        ]))
      ) );
  }
}

class grid extends StatefulWidget{
    grid({super.key});

    @override
  State<grid> createState() => gridState();
  }

class gridState extends State<grid> {
  final List<Producty> _items = [];

  Future <void> gridview2() async {
    final collectionref = FirebaseFirestore.instance.collection("clothing");
    final docref = await collectionref.get();
    docref.docs.forEach((element) {
      _items.add(
          Producty.fromJson(element.data())
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return

    // appBar: AppBar(backgroundColor: themecol,title: Text("My Cart",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,),),),


    FutureBuilder(future: gridview2(),
    builder: (context,snapshot){
    return
      GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
      gridDelegate: const
      SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 350,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
        itemCount: _items.length, itemBuilder: (context, index){

        final item1 = _items[index];
      return


            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Heart(item:item1)));
            },
              child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  color: Colors.white),
                child: Column(
                  children: [
                    ClipRRect(borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                      child: Image.network("${_items[index].img}", height: 190,
                        width: double.infinity,
                        fit: BoxFit.fill,),),
                    Padding(padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          normalText("${_items[index].brand}", Colors.white, 5.0),
                          normalText(
                              "${_items[index].price}", Colors.white, 10.0),
                          normalText("${_items[index].name}", Colors.white, 10.0),
                          // normalText("${_items[index].size }",Colors.white,10),

                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(onPressed: () {},
                                  icon: Icon(
                                    CupertinoIcons.heart,
                                  )),

                              IconButton(onPressed: () {},
                                  icon: Icon(
                                    CupertinoIcons.shopping_cart,
                                  )),
                            ],)

                        ],
                      ),)
                  ],
                ),),
            );
    });
  }

    );
  }
}




            // final List<Map<String, dynamic>> gridMap = [

    //   {
    //     "title": "grey top",
    //     "price": "\₹230",
    //     "images": "https://m.media-amazon.com/images/I/91Bqm-uSqZL._UX569_.jpg",
    //   },
    //   {
    //     "title": "Party dress",
    //     "price": "\₹789",
    //     "images": "https://m.media-amazon.com/images/I/616W45+D7GL._UX679_.jpg",
    //   },
    //   {
    //     "title": "top",
    //     "price": "\₹649",
    //     "images": "https://m.media-amazon.com/images/I/51+D+yZAsBL._UX679_.jpg",
    //   },
    //   {
    //     "title": "Kurti",
    //     "price": "\₹309",
    //     "images": "https://m.media-amazon.com/images/I/71WTxTRa1NL._UY741_.jpg",
    //   },
    //   {
    //     "title": "top",
    //     "price": "\₹230",
    //     "images": "https://m.media-amazon.com/images/I/715EhrTUZML._UY741_.jpg",
    //   },
    //   {
    //     "title": "tshirt",
    //     "price": "\₹238",
    //     "images": "https://m.media-amazon.com/images/I/71nSSJ8BrgL._UX679_.jpg",
    //   },
    //   {
    //     "title": "top",
    //     "price": "\₹350",
    //     "images": "https://m.media-amazon.com/images/I/71n5599iwoL._UX569_.jpg",
    //   },
    //   {
    //     "title": "Anarkali",
    //     "price": "\₹230",
    //     "images": "https://m.media-amazon.com/images/I/81PtbFjdckL._UX569_.jpg",
    //   },
    //   {
    //     "title": "Party dress",
    //     "price": "\₹2530",
    //     "images": "https://m.media-amazon.com/images/I/61H839LrcML._UX569_.jpg",
    //   },
    //   {
    //     "title": "tshirt",
    //     "price": "\₹380",
    //     "images": "https://m.media-amazon.com/images/I/7116bmFTl5L._UX569_.jpg",
    //   },
    //   {
    //     "title": "Party dress",
    //     "price": "\₹1058",
    //     "images": "https://m.media-amazon.com/images/I/51duIIEnGiL._UY679_.jpg",
    //   },
    //   {
    //     "title": "Formal Kurti",
    //     "price": "\₹280",
    //     "images": "https://m.media-amazon.com/images/I/81EViOHD9OL._UX569_.jpg",
    //   },
    // ];
    //
    // @override
    // Widget build(BuildContext context) {
    //   return GridView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //   crossAxisCount: 2,crossAxisSpacing: 12,mainAxisSpacing: 10,mainAxisExtent: 320),
    //   itemCount: gridMap.length, itemBuilder: (_, index) {
    //   return InkWell(onTap: (){
    //   Navigator.push(context, MaterialPageRoute(builder: (context) =>Heart()));
    //   },
    //   child: Container(
    //
    //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
    //   child: Column(
    //   children:[ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)) ,
    //   child: Image.network("${gridMap.elementAt(index)['images']}",
    //   height: 200,width: double.infinity,fit: BoxFit.cover,),),
    //
    //   Padding(padding: const EdgeInsets.all(5.0),child:
    //   Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text("${gridMap.elementAt(index)['title']}",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,),
    //   ), const SizedBox(height: 8.0,),
    //
    //   Text("${gridMap.elementAt(index)['price']}"),
    //
    //   const SizedBox(height: 8.0,),
    //   Row(children: [
    //   IconButton(onPressed: (){},
    //   icon: Icon(
    //   CupertinoIcons.heart,
    //   )),
    //
    //   IconButton(onPressed: (){},
    //   icon: Icon(
    //   CupertinoIcons.shopping_cart,
    //   )),
    //   ],)
    //   ],),)
    //   ],
    //   ),
    //   ),
    //   );
    //   },);




