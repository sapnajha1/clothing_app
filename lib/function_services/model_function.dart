// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../model/item_model.dart';
//
//
// final List<Product> _items=[];
//
//
//
// Future <void> gridview(Product _items) async{
//   final collectionref = FirebaseFirestore.instance.collection("clothing");
//   final docref =await collectionref.get();
//   docref.docs.forEach((element){
//     _items.add(
//         Product.fromJson(element.data())
//     );
//   });
// }