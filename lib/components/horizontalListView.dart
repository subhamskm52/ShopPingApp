import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  Widget getCategory(String imgLoc, String imgName, Function onTap) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: 150,
      child: FlatButton(
        onPressed: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imgLoc),
            Text(
              imgName,
              style: TextStyle(
                color: Colors.red.shade700,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            getCategory("images/categories/shirts.png", "shirts", () {
              print("shirts");
            }),
            getCategory("images/categories/skirts.png", "skirts", () {}),
            getCategory("images/categories/tshirts.png", "t-shirts", () {}),
            getCategory("images/categories/shoes.png", "shoes", () {}),
            getCategory("images/categories/watches.jpg", "watches", () {}),
          ],
        ),
      ),
    );
  }
}
