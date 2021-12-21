// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:travel_app/widget/most_pop.dart';
import 'widget/Travel.blog.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[500],
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text('Travel', style: TextStyle(fontSize: 30)),
            ),
            Expanded(flex: 2, child: TravelBlog()),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most View',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('View all',
                      style: TextStyle(
                          fontSize: 18, color: Colors.deepOrange[400])),
                ],
              ),
            ),
            Expanded(flex: 1, child: MostPopular()),
          ],
        ));
  }
}
