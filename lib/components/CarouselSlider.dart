import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class carouselSlider extends StatefulWidget {
  @override
  _carouselSliderState createState() => _carouselSliderState();
}

class _carouselSliderState extends State<carouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      height: 300,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkm2MJTb5ROpaIOspg1GtVHUQ46xHZV__sAqIbanTnPWWoUDSDkA&s",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxeKygOqSjhwx5C52Y9q30HSyZVM9l5vtf1T_bEtE3QuwcIye9&s",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSwG42flSEc9b1YJ8gsXXqBede3JbMoVrNJpRaLNsNlMjI2jlw&s",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMggF1jtqzNkTqyJ8OR7L1jw1CaUuFnhB3YWFi4OY5yAFNojDCQA&s",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRakjhJ6KUggHrNx8mcYFofY3svcoZGvCLsctrPnADDCdhxfT1JNQ&s",
            fit: BoxFit.cover,
          ),
        ],
        autoplay: false,
        animationDuration: Duration(milliseconds: 500),
        animationCurve: Curves.fastOutSlowIn,
        dotIncreasedColor: Colors.green.shade700,
        indicatorBgPadding: 0,
      ),
    );
  }
}
