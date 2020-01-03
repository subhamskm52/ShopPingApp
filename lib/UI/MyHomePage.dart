import 'package:feed_seed/UI/SearchPage.dart';
import 'package:flutter/material.dart';
import 'DrawerList.dart';
import '../components/CarouselSlider.dart';
import '../components/horizontalListView.dart';
import '../components/ProductGridView.dart';
import '../UI/Cart.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.id, this.username, this.email, this.photoUrl,
      {Key key, this.title}) : super(key: key);
  final String id;
  final String username;
  final String email;
  final String photoUrl;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white70,
              size: 25,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => SearchPage()));
            },
          ),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white70,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => MyCart()));
              })
        ],
      ),
      drawer: Drawer(
        child: DrawerList(
            widget.id, widget.username, widget.email, widget.photoUrl),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                carouselSlider(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.redAccent),
                  ),
                ),
                HorizontalListView(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Recent Products",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.redAccent),
                  ),
                ),
                ProductGridView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
