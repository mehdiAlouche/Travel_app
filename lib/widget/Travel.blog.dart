// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/Module/Travel.module.dart';
import 'package:travel_app/detials.page.dart';

class TravelBlog extends StatelessWidget {
  final _list = Travel.generateTravelBlog();
  final _pageCtrl = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageCtrl,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          var travel = _list[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DetialsPage(
                  travel: travel,
                );
              }));
            },
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10, right: 20, bottom: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      travel.url,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    left: 25,
                    bottom: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            travel.location,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            travel.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    right: 20,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
