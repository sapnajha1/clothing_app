//
// import 'package:clothing_app/model/item_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// Future<bool> setItems(Product product ) async {
//   try{
//     final collectionRef = FirebaseFirestore.instance.collection("clothing");
//     await collectionRef.doc().set(product.toJson());
//     return true;
//   }
//   catch(e){
//     return false;
//   }
// }