import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final double totalPrice = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: Text("Cart"),
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
        body: Column(),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.redAccent,
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                title: Text(
                  "total:\$ $totalPrice",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                ),
                title: Text(
                  "Proceed",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ]));
  }
}
