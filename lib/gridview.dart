import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {

  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "white sneeker",
      "price": "\$230",
      "images": "https://media.glamour.com/photos/570431bbc08406e85210502b/master/pass/fashion-2016-03-05-spring-trend-cold-shoulder-proenza-schouler-main.jpg",
    },
    {
      "title": "white sneeker",
      "price": "\$230",
      "images": "https://media.glamour.com/photos/570431bbc08406e85210502b/master/pass/fashion-2016-03-05-spring-trend-cold-shoulder-proenza-schouler-main.jpg",
    },
    {
      "title": "white sneeker",
      "price": "\$230",
      "images": "https://media.glamour.com/photos/570431bbc08406e85210502b/master/pass/fashion-2016-03-05-spring-trend-cold-shoulder-proenza-schouler-main.jpg",
    },
    {
      "title": "white sneeker",
      "price": "\$230",
      "images": "https://media.glamour.com/photos/570431bbc08406e85210502b/master/pass/fashion-2016-03-05-spring-trend-cold-shoulder-proenza-schouler-main.jpg",
    },
    {
      "title": "white sneeker",
      "price": "\$230",
      "images": "https://media.glamour.com/photos/570431bbc08406e85210502b/master/pass/fashion-2016-03-05-spring-trend-cold-shoulder-proenza-schouler-main.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemCount: gridMap.length, itemBuilder: (_, index) {
      return Container(
        color: Colors.yellow,
      );
    },);
  }
}