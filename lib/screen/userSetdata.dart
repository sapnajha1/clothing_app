import 'package:flutter/material.dart';
import 'package:clothing_app/function_services/post.dart';
import 'package:clothing_app/model/item_model.dart';

class UserSet extends StatefulWidget {
  const UserSet({Key? key});

  @override
  State<UserSet> createState() => _UserSetState();
}

class _UserSetState extends State<UserSet> {
  Map<dynamic, dynamic> postProduct = {};

  TextEditingController brandctrl = TextEditingController();
  TextEditingController imgctrl = TextEditingController();
  TextEditingController namectrl = TextEditingController();
  TextEditingController pricectrl = TextEditingController();
  TextEditingController sizectrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.0), // Adjust top padding as needed
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 50,
                        ),
                        Text(
                          "Add Image",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                buildTextField("Image Link", imgctrl),
                SizedBox(height: 20),
                buildTextField("Product name", namectrl),
                SizedBox(height: 20),
                buildTextField("Product Brand name", brandctrl),
                SizedBox(height: 20),
                buildTextField("Product Size", sizectrl),
                SizedBox(height: 20),
                buildTextField("Product Price", pricectrl),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          brandctrl.clear();
                          imgctrl.clear();
                          namectrl.clear();
                          pricectrl.clear();
                          sizectrl.clear();
                        });
                      },
                      child: buildButton("Reset"),
                    ),
                    InkWell(
                      onTap: () {
                        setItems(Product(
                          brand: brandctrl.text,
                          img: imgctrl.text,
                          name: namectrl.text,
                          price: pricectrl.text,
                          size: sizectrl.text,
                        ));
                      },
                      child: buildButton("Submit"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        onChanged: (value) {
          postProduct[labelText.toLowerCase()] = value;
        },
        controller: controller,
        style: TextStyle(color: Colors.black26),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black26),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildButton(String text) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(color: Colors.blue),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
