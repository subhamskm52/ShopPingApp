import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}


class _MyCartState extends State<MyCart> {
  double totalPrice = 0;
  var list = [];
  var ids = [];
  SharedPreferences preferences;

  void getCartList() async {
    preferences = await SharedPreferences.getInstance();
    QuerySnapshot temp = await Firestore.instance.collection("cart").document(
        preferences.get("email")).collection("addedToCart").getDocuments();
    setState(() {
      list = temp.documents.toList();
    });
  }

  void deleteItem(id) {
    var docref = Firestore.instance.collection("cart").document(
        preferences.get("email")).collection("addedToCart")
        .document(id)
        .delete();
  }
  @override
  void initState() {
    getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
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
          ],
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(list[i]["name"]),
                  subtitle: Text(list[i]["price"]),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteItem(list[i]['id']);
                    setState(() {
                      list.removeAt(i);
                    });
                  },


                )
              ],
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blueGrey.shade700,
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
