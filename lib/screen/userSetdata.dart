import 'dart:developer';
import 'dart:io';
// import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserSet extends StatefulWidget {
  const UserSet({super.key});

  @override
  State<UserSet> createState() => _UserSetState();
}

class _UserSetState extends State<UserSet> {
  TextEditingController catogriescomtroller = TextEditingController();
  TextEditingController brandcontroller = TextEditingController();

  addData(String catog, String brand)async{
    if (catog=="" && brand==""){
      log("Enter required field");
    }else{
      FirebaseFirestore.instance.collection("useradd").doc(catog).set({
        'Catogries': catog,
        'Brand':brand,
      }).then((value) => log("Data saved"));
    }
  }

  showAlertBox(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Pick image from"),
        content: Column(mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                pickimage(ImageSource.camera);
                Navigator.pop(context);
              },
              leading: Icon(Icons.camera_alt,),
              title: Text("Camera"),
            ),

            ListTile(
              onTap: (){
                pickimage(ImageSource.gallery);
                Navigator.pop(context);
              },
              leading: Icon(Icons.image),
              title: Text("Gallery"),
            )
          ],
        ),
      );
    }
    );
  }

  File? getImage;


  pickimage(ImageSource imageSource)async{
    try{
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo==null) return;
      final tempimage = File(photo.path);
      setState(() {
        getImage=tempimage;
      });
    }catch(ex){
      log(ex.toString());
    }
  }

  firebaseStore(String catog, String brand)async{

    if (catog=="" && brand=="" && getImage==""){
      return showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text("Enter required Details"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            },
                child: Text("OK"))
          ]
          ,
        );
      });
    }
    else{
      UserCredential? userCredential;
      try {
        userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: catog, password: brand).then((value) {
          upload();
        });
      }
      on FirebaseAuthException catch(ex){
        log(ex.toString());
      }
    }
  }

  upload()async{

    UploadTask uploadTask = FirebaseStorage.instance.ref("Clothes Images")
        .child(catogriescomtroller.text.toString()).putFile(getImage!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String photoUrl = await taskSnapshot.ref.getDownloadURL();
    FirebaseFirestore.instance.collection("Clothe Image").doc(catogriescomtroller.text.toString()).set({
           "Catagories": catogriescomtroller.text.toString(),
            "BrandName": brandcontroller.text.toString(),
             "ImageUrl": photoUrl,
    }).then((value){
      log("Data updated");
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your Product"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [

          InkWell(onTap: (){
            showAlertBox();
          },
            child: getImage!=null? CircleAvatar
              (radius: 80,
              backgroundImage: FileImage(getImage!),
           ) : CircleAvatar(
              radius: 80,
                child: Icon(Icons.person,size: 80,)

            )
          ),


          //
          SizedBox(height: 20,),
          TextField(
            controller: catogriescomtroller,
            decoration: InputDecoration(hintText: "Enter clothes catagories",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
          ),

          SizedBox(height: 20,),
          TextField(
            controller: brandcontroller,
            decoration: InputDecoration(hintText: "Enter Brand Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
          ),

          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            addData(catogriescomtroller.text.toString(), brandcontroller.text.toString());
          },
              child: Text("Save Data")),

          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            // addData(catogriescomtroller.text.toString(), brandcontroller.text.toString());
            upload(
              // catogriescomtroller.text.toString(),
              // brandcontroller.text.toString(),
            );
          },
              child: Text("Upload Data"))
        ],),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:clothing_app/function_services/post.dart';
// import 'package:clothing_app/model/item_model.dart';
//
// class UserSet extends StatefulWidget {
//   const UserSet({Key? key});
//
//   @override
//   State<UserSet> createState() => _UserSetState();
// }
//
// class _UserSetState extends State<UserSet> {
//   Map<dynamic, dynamic> postProduct = {};
//
//   TextEditingController brandctrl = TextEditingController();
//   TextEditingController imgctrl = TextEditingController();
//   TextEditingController namectrl = TextEditingController();
//   TextEditingController pricectrl = TextEditingController();
//   TextEditingController sizectrl = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.only(top: 50.0), // Adjust top padding as needed
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.blueGrey,
//                     border: Border.all(color: Colors.black),
//                   ),
//                   child: Center(
//                     child: Stack(
//                       children: [
//                         Icon(
//                           Icons.add,
//                           color: Colors.black,
//                           size: 50,
//                         ),
//                         Text(
//                           "Add Image",
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 buildTextField("Image Link", imgctrl),
//                 SizedBox(height: 20),
//                 buildTextField("Product name", namectrl),
//                 SizedBox(height: 20),
//                 buildTextField("Product Brand name", brandctrl),
//                 SizedBox(height: 20),
//                 buildTextField("Product Size", sizectrl),
//                 SizedBox(height: 20),
//                 buildTextField("Product Price", pricectrl),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           brandctrl.clear();
//                           imgctrl.clear();
//                           namectrl.clear();
//                           pricectrl.clear();
//                           sizectrl.clear();
//                         });
//                       },
//                       child: buildButton("Reset"),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setItems(Product(
//                           brand: brandctrl.text,
//                           img: imgctrl.text,
//                           name: namectrl.text,
//                           price: pricectrl.text,
//                           size: sizectrl.text,
//                         ));
//                       },
//                       child: buildButton("Submit"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextField(String labelText, TextEditingController controller) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black),
//       ),
//       child: TextField(
//         onChanged: (value) {
//           postProduct[labelText.toLowerCase()] = value;
//         },
//         controller: controller,
//         style: TextStyle(color: Colors.black26),
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 10),
//           labelText: labelText,
//           labelStyle: TextStyle(color: Colors.black26),
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
//
//   Widget buildButton(String text) {
//     return Container(
//       height: 40,
//       width: 100,
//       decoration: BoxDecoration(color: Colors.blue),
//       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//       child: Center(
//         child: Text(
//           text,
//           style: TextStyle(fontSize: 14),
//         ),
//       ),
//     );
//   }
// }
