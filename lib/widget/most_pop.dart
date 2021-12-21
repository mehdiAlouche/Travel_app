// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/Module/Travel.module.dart';
import 'package:travel_app/detials.page.dart';

class MostPopular extends StatelessWidget {
  final _list = Travel.generateMostPopularlBlog();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        scrollDirection: Axis.horizontal,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    travel.url,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 15,
                    child: Column(
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            travel.location,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          );
        },
        separatorBuilder: (_, index) => const SizedBox(width: 15),
        itemCount: _list.length);
  }
}
