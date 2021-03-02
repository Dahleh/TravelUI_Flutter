import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../places_data.dart';

class TravelContentSection extends StatelessWidget {
  final double height;
  final double width;
  final bool isLargeImg;

  const TravelContentSection(
      {Key key, this.width, this.height, this.isLargeImg = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Popular Attractions",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(199, 167, 128, 1)),
                  )),
            ],
          ),
          SizedBox(height: 5),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext c, BoxConstraints constr) {
                return Container(
                  width: constr.maxWidth,
                  height: constr.maxHeight,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: dataResult.map(
                      (item) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            width: isLargeImg
                                ? constr.maxWidth * .61
                                : constr.maxWidth * .6,
                            height: constr.maxHeight,
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Stack(
                                  children: [
                                    Container(
                                      width: constr.maxWidth * .59,
                                      height: constr.maxHeight * .53,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('Assets/dubai.jpg'),
                                          colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.2),
                                            BlendMode.hardLight,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 16,
                                      left: 20,
                                      child: Text(
                                        item.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'Assets/Rectangle@3x.png'),
                                        ),
                                      ),
                                      width: 70,
                                      height: 70,
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Beatrice Kim',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Invalid Date',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: <Widget>[
                                            SvgPicture.asset(
                                              'Assets/Views.svg',
                                              color: Color.fromRGBO(
                                                  128, 199, 183, 1),
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              item.views,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 11,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            SvgPicture.asset(
                                              'Assets/Like.svg',
                                              color: Color.fromRGBO(
                                                  128, 199, 183, 1),
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              item.likes,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
