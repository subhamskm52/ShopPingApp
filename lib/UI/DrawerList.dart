import 'package:flutter/material.dart';
import 'SearchPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Login.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerList extends StatelessWidget {

  String id;
  String username;
  String email;
  String photoUrl;


  DrawerList(this.id, this.username, this.email, this.photoUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          //user info drawer
          UserAccountsDrawerHeader(
            accountName: Text(username == null ? "username" : username),
            accountEmail: Text(email == null ? "email@email.com" : email),
            currentAccountPicture: GestureDetector(
              onTap: () {
                print("profile pic is tapped");
              },
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(photoUrl == null
                      ? "https://i.stack.imgur.com/34AD2.jpg"
                      : photoUrl)),
            ),
            decoration: BoxDecoration(color: Colors.deepPurple),
          ),
          //drawer body
          ListTile(
            onTap: () {
              print('my home drawer is tapped');
            },
            title: Text("Home Page"),
            leading: Icon(Icons.home),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
            title: Text("Search"),
            leading: Icon(Icons.search),
          ),
          ListTile(
            onTap: () {
              print("My account is tapped");
            },
            title: Text("My Account"),
            leading: Icon(
              Icons.account_circle,
              color: Colors.purple,
            ),
          ),
          ListTile(
            onTap: () {
              print("My order tapped");
            },
            title: Text("My Order"),
            leading: Icon(Icons.shopping_basket),
          ),

          ListTile(
            onTap: () {
              print("categories is tapped");
            },
            title: Text("Category"),
            leading: Icon(Icons.category),
          ),
          ListTile(
            onTap: () {
              print("fav is tapped");
            },
            title: Text("Favorite"),
            leading: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          ListTile(
            title: Text("NIT STORE"),
            leading: Icon(Icons.store),
            onTap: () => _launchUrl("http://nitstore.herokuapp.com/"),

          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),

          ListTile(
            title: Text("Setting"),
            leading: Icon(
              Icons.settings,
              color: Colors.blueGrey,
            ),
            onTap: () {
              print("setting is tapped");
            },
          ),
          ListTile(
            title: Text("About"),
            leading: Icon(Icons.error),
            onTap: () {
              print("about is tapped");
            },
          ),
          ListTile(
            title: Text("Log Out"),
            leading: Icon(Icons.arrow_forward_ios),
            onTap: () async
            {
              bool signedIn = true;
              GoogleSignIn g = GoogleSignIn();
              await g.signOut();
              signedIn = await g.isSignedIn();
              if (signedIn) {
                Fluttertoast.showToast(msg: "something wrong");
                return;
              }
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
      ),
    );
  }

  _launchUrl(String url) async {
    try {
      await launch(url);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "Something Wrong");
    }
  }
}
