import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Color primaryColor = Color(0xffdc2f2e);

class TravelCategoryItem extends StatelessWidget {
  final String name;
  final String img;

  const TravelCategoryItem(
      {Key key, this.name = "Hotel", this.img = "Hotel.svg"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 128,
      child: Stack(
        children: <Widget>[
          Container(
            width: 103,
            height: 122,
            child: InkWell(
              onTap: () {},
              child: Material(
                color: Colors.black,
                elevation: 2,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 22, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.asset(
                        '$img',
                        color: Color.fromRGBO(128, 199, 183, 1),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "$name",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
