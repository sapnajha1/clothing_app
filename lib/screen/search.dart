import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  // List searchResult = [];

  final searchcrtl = TextEditingController();
  Map<String, dynamic>? usermap;
  String? name;

  Future<void> onSearch() async {
    try{
      FirebaseFirestore _Firestore = FirebaseFirestore.instance;
      await _Firestore.collection("clothing")
          .where("name",isEqualTo:searchcrtl.text)
          .get()
      .then((value) {
        setState(() {
          usermap = value.docs[1].data();
        });
      });
      print(usermap);

      }catch(error){
        print("an error Occured $error");
      }
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Product")),

      body: SingleChildScrollView(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(children: [

        Row(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 60,width: 260,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
          color: Colors.black12),
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            controller: searchcrtl,
            decoration: InputDecoration(border: OutlineInputBorder(borderSide: 
            BorderSide.none,borderRadius: BorderRadius.circular(50)),
            hintText: "Search"),
          ),),),
          SizedBox(width: 10,),
          InkWell(onTap: () {
            onSearch();
          },
          child: Container(height: 60,width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
          color: Colors.blue),
          child: const Center(
            child: Text("Search",style:TextStyle(color: Colors.white ,fontSize: 18),)
          ),),),]),

          usermap!=null?Column(
            children: [
              SizedBox(height: 10,),
              Image.network(usermap!["img"]==null?
              "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"
                  :usermap!["img"]),

              SizedBox(height: 10,),
              Text(usermap!["brand"],style: TextStyle(fontSize: 40),)
            ],
          ):
          SizedBox()
        ],

      ),),),
    );
  }
}
