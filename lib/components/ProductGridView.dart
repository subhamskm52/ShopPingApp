import 'package:flutter/material.dart';
import '../UI/ProductDetails.dart';

class ProductGridView extends StatefulWidget {
  @override
  _ProductGridViewState createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  dynamic prodList = [
    {"name": "shirt", "price": "20"},
    {"name": "pants", "price": "20"},
    {"name": "t-shirt", "price": "20"},
    {"name": "shorts", "price": "20"},
    {"name": "boots", "price": "20"},
    {"name": "shirt", "price": "20"},
    {"name": "shirt", "price": "20"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: prodList.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          itemBuilder: (BuildContext context, index) {
            return ProductCard(prodList[index]["name"],
                prodList[index]["price"], "type photoes url");
          }),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String url;

  ProductCard(this.name, this.price, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) =>
                ProductDetails(name, price, "images/cos.jpg"))),
        //put original url instead of dummy
        child: Card(
          child: Container(
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "\$$price",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
              child: Image.asset(
                "images/cos.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
