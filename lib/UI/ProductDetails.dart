import 'package:flutter/material.dart';
import 'DrawerList.dart';

class ProductDetails extends StatelessWidget {
  final String prodName;
  final String price;
  final String imgUrl;

  ProductDetails(this.prodName, this.price, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    debugDescribeChildren();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text(prodName),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white70,
                size: 25,
              ),
              onPressed: () {
                print("search button clicked");
              }),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white70,
                size: 25,
              ),
              onPressed: () {
                print("cart button pressed");
              })
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            height: 300,
            child: Image.asset(imgUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    prodName,
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "\$$price",
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 150,
                  child: ListTile(
                    title: Text("Add To Cart"),
                    leading: Icon(Icons.shopping_cart),
                  ),
                ),
                Container(
                  width: 180,
                  child: ListTile(
                      title: Text("Favourate"),
                      leading: Icon(
                        Icons.favorite,
                        color: Colors.red.shade900,
                      )),
                )
              ],
            ),
          ),
          Container(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.shade900,
              ),
              child: MaterialButton(
                onPressed: () {
                  print("buy is pressed");
                },
                child: Text(
                  "BUY",
                  style: TextStyle(
                      fontSize: 24, color: Colors.white, letterSpacing: 5),
                ),
              ),
            ),
          ),
          Container(
              color: Colors.white70,
              padding: EdgeInsets.all(16),
              child: Text("hola amigos this for test only"))
        ],
      ),
    );
  }
}
