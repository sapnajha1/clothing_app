import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final searchcrtl = TextEditingController();
  Map<String, dynamic>? usermap;

  Future<void> onSearch() async {
    try {
      FirebaseFirestore _Firestore = FirebaseFirestore.instance;
      await _Firestore.collection("clothing")
          .where("name", isEqualTo: searchcrtl.text)
          .get()
          .then((value) {
        setState(() {
          usermap = value.docs.isNotEmpty ? value.docs[0].data() : null;
        });
      });
    } catch (error) {
      print("An error occurred: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Search Product")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.05),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenHeight * 0.05),
                      color: Colors.black12,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: TextField(
                        controller: searchcrtl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(screenHeight * 0.05),
                          ),
                          hintText: "Search",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  InkWell(
                    onTap: () {
                      onSearch();
                    },
                    child: Container(
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenHeight * 0.05),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.015),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              usermap != null
                  ? Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  Image.network(
                    usermap!["img"] ??
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    usermap!["brand"] ?? "",
                    style: TextStyle(fontSize: screenWidth * 0.1),
                  ),
                ],
              )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
