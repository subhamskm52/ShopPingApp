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
            "https://static.dezeen.com/uploads/2019/10/circulose-recycled-cotton-clothing-sustainable-fashion-stockholm-sweden_hero-a.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://images-eu.ssl-images-amazon.com/images/G/31/img19/Fashion/WA19/CLOTHING._CB1198675309_.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsmoGRHYCaX0RaBv0sypvMnufibOtxctQ4Mxc4CVNTpKh_xihX&s",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://cdn.cnn.com/cnnnext/dam/assets/130425151718-zooey-deschanel-august-2012-story-top.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://allstarbio.com/wp-content/uploads/2018/08/Maddie-Ziegler.jpg",
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
