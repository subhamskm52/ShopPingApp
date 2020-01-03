import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery;

  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
        centerTitle: true,
        actions: <Widget>[
          SizedBox(
            width: 100,
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              controller: controller,
              style: TextStyle(
                color: Colors.white70,
              ),
              decoration: InputDecoration(
                labelText: "search here...",
                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onChanged: (value) {
                _searchQuery = value;
              },
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white70,
                size: 25,
              ),
              onPressed: () {
                print("searching $_searchQuery");
              }),
        ],
      ),
      body: Column(
        children: <Widget>[Text("")],
      ),
    );
  }
}
