// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_app/Module/Travel.module.dart';

class DetialsPage extends StatelessWidget {
  // const name({Key? key}) : super(key: key);
  final Travel travel;
  final double expandeHeight = 300;
  final double roundedContaine = 50;
  DetialsPage({required this.travel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildSliverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, right: 15, left: 15),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
        delegate: DetailSliverDelegate(
            travel: travel,
            expandeHeight: expandeHeight,
            roundedContaine: roundedContaine));
  }

  Widget _buildDetail() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserInfo(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1.5),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: FeaturedWidget(),
          )
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              travel.url,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  travel.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  travel.location,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(Icons.share)
        ],
      ),
    );
  }
}

class FeaturedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _list = Travel.generateMostPopularlBlog();
    return ListView.separated(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var travel = _list[index];
          return SizedBox(
            width: 120,
            child: Image.asset(
              travel.url,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (_, index) => SizedBox(
              width: 10,
            ),
        itemCount: _list.length);
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandeHeight;
  final double roundedContaine;
  DetailSliverDelegate({
    required this.travel,
    required this.expandeHeight,
    required this.roundedContaine,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.9,
          child: Image.asset(travel.url,
              width: MediaQuery.of(context).size.width,
              height: expandeHeight,
              fit: BoxFit.cover),
        ),
        Positioned(
          top: expandeHeight - roundedContaine - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContaine,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
        ),
        Positioned(
            top: expandeHeight - shrinkOffset - 120,
            left: 30,
            child: Column(
              children: [
                Text(travel.name,
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                Text(
                  travel.location,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ))
      ],
    );
  }

  @override
  double get maxExtent => expandeHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
