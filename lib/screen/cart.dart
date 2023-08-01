import 'package:clothing_app/screen/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clothing_app/const/color.dart';
import 'package:clothing_app/widget/custom_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/model.dart';


class model_home extends StatefulWidget {
  const model_home({super.key});

  @override
  State<model_home> createState() => _model_homeState();
}

class _model_homeState extends State<model_home> {
  final List<Product> _items=[];

  Future <void> gridview() async{
    final collectionref = FirebaseFirestore.instance.collection("clothing");
    final docref =await collectionref.get();
    docref.docs.forEach((element){
      _items.add(
          Product.fromJson(element.data())
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: themecol,

      appBar: AppBar(backgroundColor: themecol,title: Text("My Cart",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,),),),


      body: FutureBuilder(future: gridview(),
          builder: (context,snapshot){
            return
              GridView.builder(gridDelegate:const
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  mainAxisExtent: 350,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
                  itemCount: _items.length,itemBuilder: (context,index) =>

                        Container(decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(20),color: Colors.white),
                          child: Column(
                            children: [
                              ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                child: Image.network("${_items[index].img}",height: 190,width: double.infinity,fit: BoxFit.fill,),),
                              Padding(padding: EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [

                                    normalText("${_items[index].brand}",Colors.white,5.0),
                                    normalText("${_items[index].price}",Colors.white,10.0),
                                    normalText("${_items[index].name}",Colors.white,10.0),
                                    // normalText("${_items[index].size }",Colors.white,10),

                                    Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                                      IconButton(onPressed: (){},
                                          icon: Icon(
                                            CupertinoIcons.heart,
                                          )),

                                      IconButton(onPressed: (){},
                                          icon: Icon(
                                            CupertinoIcons.shopping_cart,
                                          )),
                                    ],)

                                  ],
                                ),)
                            ],
                          ),),
                      );
          }
          ),
    );
  }
}
