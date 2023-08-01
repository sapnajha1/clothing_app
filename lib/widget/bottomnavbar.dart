import 'package:clothing_app/const/color.dart';
import 'package:clothing_app/screen/userSetdata.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:clothing_app/screen/cart.dart';
import 'package:clothing_app/screen/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:clothing_app/screen/home.dart';

import '../screen/search.dart';

class bottomnav extends StatefulWidget {
  const bottomnav({Key? key}) : super(key: key);

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int selectedindex = 0;
  var screens = [house(),Heart(item: int),model_home(),search(),UserSet()];

  void onitemtapped(int index){
    setState(() {
      selectedindex=index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final items=<Widget>
    [Icon(Icons.home,size: 30,),
    Icon(Icons.favorite,size: 30,color: Colors.red,),
    Icon(Icons.shopping_bag_outlined,size: 30,color: Colors.black,),
      Icon(Icons.search,size: 30,color: Colors.black,),

      Icon(Icons.person,size: 30,color: Colors.black,)];

    return Scaffold(backgroundColor: themecol,
    body: screens[selectedindex],
    bottomNavigationBar: CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      height: 60,
      items:items,
      onTap:onitemtapped,
    )



















    // return Scaffold(
        //     backgroundColor:Colors.black,
        //     body: screens[selectedindex],
        //     bottomNavigationBar:BottomNavigationBar(
        //         items:[       BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,), label: "Home"),
        //                       BottomNavigationBarItem(icon: Icon(Icons.favorite,color: Colors.black,), label: "Wishlist"),
        //                       BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,), label: "Cart"),
        //                       // BottomNavigationBarItem(icon: Icon(Icons.play_circle,color: Colors.black,), label: "gold")
        //                     ],
        //                     backgroundColor: Colors.white,
        //                     selectedItemColor: Colors.blue,
        //                     unselectedItemColor: Colors.black45,
        //                     elevation: 0,
        //                     currentIndex: selectedindex,
        //                     onTap: onitemtapped,
        //                   ),
        //                 );

//     final items=<Widget>
//     [Icon(Icons.home,size: 30,),
//     Icon(Icons.favorite,size: 30,color: Colors.red,),
//     Icon(Icons.shopping_bag_outlined,size: 30,color: Colors.black,)];
//
//     return Scaffold(backgroundColor: Colors.white,
//     body: screens[selectedindex],
//     bottomNavigationBar: CurvedNavigationBar(
//       height: 60,
//       items:items,
//       onTap:onitemtapped,

    );}
}
