import 'package:flutter/material.dart';
import 'package:clothing_app/function_services/post.dart';
import 'package:clothing_app/model/item_model.dart';

class UserSet extends StatefulWidget {
  const UserSet({super.key});

  @override
  State<UserSet> createState() => _UserSetState();
}

class _UserSetState extends State<UserSet> {

  Map<dynamic,dynamic> postProduct={};

  TextEditingController brandctrl=TextEditingController();
  TextEditingController imgctrl=TextEditingController();
  TextEditingController namectrl=TextEditingController();
  TextEditingController pricectrl=TextEditingController();
  TextEditingController sizectrl=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child:Padding(padding: EdgeInsets.symmetric(horizontal: 70,vertical: 30),
      child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
        Stack(children: [Container(height: 280,width: 280,decoration: BoxDecoration(color: Colors.blueGrey,border: Border.all(color: Colors.black) ),),
          Padding(padding: EdgeInsets.symmetric(horizontal: 80,vertical: 80),
              child:Column(children:[InkWell(onTap: (){},child: Icon(Icons.add,color: Colors.black,size: 50,),),
                Text("Add Image",style: TextStyle(color: Colors.black,),)],))]),


        SizedBox(height: 30,),

        Text("Image Link"),
        Container(decoration:BoxDecoration(border: Border.all(color: Colors.black)),height: 50,width: 280,
            child:TextField(onChanged: (value) {
              postProduct["image"]=value;}, controller:imgctrl ,style: TextStyle(color: Colors.black26),
            )),

        SizedBox(height: 20,),

        Text("Product name"),
        Container(decoration:BoxDecoration(border: Border.all(color: Colors.black)),height: 50,width: 280,
            child:TextField(onChanged: (value) {
          postProduct["name"]=value;
        },controller:namectrl ,style: TextStyle(color: Colors.black26),
          )),
        SizedBox(height: 20,),

        Text("Product Brand name"),
        Container(decoration:BoxDecoration(border: Border.all(color: Colors.black)),height: 50,width: 280,
            child:TextField(onChanged: (value) {
           postProduct["brand"]=value;},controller:brandctrl , style: TextStyle(color: Colors.black26),
        )),
        SizedBox(height: 20,),

        Text("Product Size"),
        Container(decoration:BoxDecoration(border: Border.all(color: Colors.black)),height: 50,width: 280,
            child:TextField( onChanged: (value) {
           postProduct["size"]=value;},controller:sizectrl ,style: TextStyle(color: Colors.black26),
        )),
        SizedBox(height: 20,),

        Text("Product Price"),
        Container(decoration:BoxDecoration(border: Border.all(color: Colors.black)),height: 50,width: 280,
            child:TextField(onChanged: (value) {
          postProduct["price"]=value;}, controller:pricectrl ,style: TextStyle(color: Colors.black26),
        )),

        SizedBox(height: 20,),
        Row(children: [InkWell(onTap: (){},child:Container(height: 40,width: 120,decoration: BoxDecoration(color: Colors.blue),
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10) ,child: Text(" Reset"),),),

            SizedBox(width: 30,),
            InkWell(onTap: (){setItems(Product(brand:brandctrl.text,img: imgctrl.text,name: namectrl.text,price: pricectrl.text,size: sizectrl.text ));},
                child:Container(height: 40,width: 120,decoration: BoxDecoration(color: Colors.blue),
                   padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10) ,child: Text(" Summit"),))],)
          ]),
      )));
  }
}
