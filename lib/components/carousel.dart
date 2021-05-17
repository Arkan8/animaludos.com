import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselAnimaludos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('assets/banner1.jpg'),
          AssetImage('assets/banner2.jpg'),
          AssetImage('assets/banner3.jpg'),
          AssetImage('assets/banner4.jpg'),
          AssetImage('assets/banner5.jpg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 3,
        indicatorBgPadding: 3,
      ),
    );
  }
}
