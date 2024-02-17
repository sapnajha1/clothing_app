import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Heart extends StatelessWidget {
  final item;

  Heart({required this.item});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, size: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.favorite, color: Colors.red, size: 30),
                      SizedBox(width: screenWidth * 0.05),
                      Icon(Icons.share, size: 30),
                      SizedBox(width: screenWidth * 0.05),
                      Badge(
                        label: Text('1'),
                        child: Icon(Icons.shopping_bag_outlined, size: 30),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Essentials Women's Grey Top ",
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.star, color: Colors.orange),
                Text(
                  "4.9 Ratings",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
                Text(
                  "2.3k+ Reviews",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
                Text(
                  "2.9k+ Sold",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: screenWidth * 0.035,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "About Items",
                  style: TextStyle(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Spacer(),
                Text(
                  "Reviews",
                  style: TextStyle(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Divider(color: Colors.black),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Brand:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        "Lara",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Color:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        "Grey",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Total Price"),
                          Text(
                            "\₹230",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.038,
                              color: Colors.blueAccent,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: screenWidth * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(7),
                            topLeft: Radius.circular(7),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.shopping_basket_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.038,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: screenWidth * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(7),
                            topRight: Radius.circular(7),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.038,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

