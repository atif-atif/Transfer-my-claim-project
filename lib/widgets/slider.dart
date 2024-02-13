import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: double.infinity,
      child: Carousel(
        images: const [
          AssetImage("images/slider_images/guide.jpeg"),
          AssetImage("images/slider_images/topUni.png"),
          //  AssetImage("images/slider_images/slidebar7.png"),
          AssetImage("images/slider_images/quizB.png"),
        ],
        dotSize: 5.0,
        dotSpacing: 15.0,
        dotColor: Colors.lightGreenAccent,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.transparent,
        //borderRadius: true,

        moveIndicatorFromBottom: 180.0,
        noRadiusForIndicator: true,
      ),
    );
  }
}
