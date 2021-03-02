import 'dart:io';
import 'dart:ui';

import 'package:TravelUI/Pages/travel-category-item.dart';
import 'package:TravelUI/Pages/travel-content-section.dart';
import 'package:TravelUI/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Color primaryColor = Color(0xffdc2f2e);

class TravelHome extends StatelessWidget {
  const TravelHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 55, 62, 1),
      bottomNavigationBar: _buildBottomBar(),
      body: _buildBody(height, width),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      color: Color.fromRGBO(51, 55, 62, 1),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 0.5,
                offset: Offset(0.7, 0.7),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'Assets/Shape.svg',
              width: 18,
              height: 18,
              color: Colors.white,
            ),
            SvgPicture.asset(
              'Assets/History.svg',
              width: 18,
              height: 18,
              color: Colors.grey.shade700,
            ),
            Container(
              width: 55,
              height: 55,
              decoration: new BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: new Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'Assets/Home.svg',
                      color: Color.fromRGBO(199, 167, 128, 1),
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              'Assets/Message.svg',
              width: 18,
              height: 18,
              color: Colors.grey.shade700,
            ),
            SvgPicture.asset(
              'Assets/Profile.svg',
              width: 18,
              height: 18,
              color: Colors.grey.shade700,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(height, width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Travel App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 39,
              ),
            ),
          ],
        ),
        Container(
          width: 60,
          alignment: Alignment.centerLeft,
          child: Stack(
            children: <Widget>[
              Container(
                width: 47,
                height: 47,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(199, 167, 128, 1),
                ),
              ),
              Positioned(
                left: 14,
                top: 13,
                child: Center(
                  child: SvgPicture.asset(
                    'Assets/settings.svg',
                    width: 21,
                    height: 21,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody(height, width) {
    return Container(
      height: height,
      width: width,
      color: Color.fromRGBO(51, 55, 62, 1),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            width: width,
            height: (Platform.isIOS) ? height * .42 : height * .50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage('Assets/Rectangle@3x.png'),
                    fit: BoxFit.cover),
              ),
              padding: EdgeInsets.only(left: 20),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    _buildAppBar(height, width),
                    SizedBox(height: 130),
                    Container(
                      width: width - 40,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white60.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset(
                            'Assets/Search.svg',
                            color: Colors.white,
                            width: 22,
                            height: 22,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'What are you looking for?',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildCategoriesSection(height, width),
          _buildContent(height, width),
        ],
      ),
    );
  }

  Widget _buildContent(height, width) {
    return Positioned(
      top: (Platform.isIOS) ? (height * .51) : (height * .56),
      width: width,
      height: height - (height * .35) + 50,
      child: LayoutBuilder(
        builder: (BuildContext c, BoxConstraints constraints) {
          final List<Widget> items = [];
          items.add(TravelContentSection(
            width: constraints.maxWidth,
            height: constraints.maxHeight * .50,
            isLargeImg: true,
          ));
          return ListView(
            padding: EdgeInsets.only(left: 20),
            children: items,
          );
        },
      ),
    );
  }

  Widget _buildCategoriesSection(height, width) {
    return Positioned(
      width: width,
      height: 120,
      top: (Platform.isIOS) ? (height * .37) : (height * .42),
      child: ListView(
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: catResult.map((item) {
          return TravelCategoryItem(
            name: item.name,
            img: item.img,
          );
        }).toList(),
        // children: List.generate(
        //   5,
        //   (int index) =>
        //       TravelCategoryItem(newItemCount: index % 3 == 0 ? 40 : 0),
        // ).toList(),
      ),
    );
  }
}
