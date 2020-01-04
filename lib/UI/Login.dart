import 'package:feed_seed/UI/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isLoggedIn = false;
  bool loading = false;
  SharedPreferences preferences;
  String id;
  String username;
  String email;
  String photoUrl;

  void isSignedIn() async {
    isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn == true) {
      preferences = await SharedPreferences.getInstance();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>
              MyHomePage(preferences.get("id"),
                preferences.get("username"),
                preferences.get("email"),
                preferences.get("photoUrl"),
                title: "Shop Stop",)));
    }
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      await googleSignIn.signIn();
      GoogleSignInAccount googleSignInAccount = googleSignIn.currentUser;
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      AuthCredential authCredential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      AuthResult authResult =
      await firebaseAuth.signInWithCredential(authCredential);
      FirebaseUser user = authResult.user;
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await firebaseAuth.currentUser();
      assert(user.uid == currentUser.uid);
      preferences = await SharedPreferences.getInstance();
      setState(() {
        preferences.setString("id", user.uid);
        preferences.setString("username", user.displayName);
        preferences.setString("email", user.email);
        preferences.setString("photoUrl", user.photoUrl);
        id = preferences.get("id");
        username = preferences.get("username");
        email = preferences.get("email");
        photoUrl = preferences.get("photoUrl");
        isLoggedIn = true;
      });

    } catch (error) {
      print("error in logging in");
      isLoggedIn = false;
    }
  }

  Widget _signInButton() {
    return SignInButton(
      Buttons.Google,
      text: "Sign in with Google",
      onPressed: () async {
        await signInWithGoogle();
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(
                          id, username, email, photoUrl,
                          title: "Stop Shop")));
        } else {
          Fluttertoast.showToast(msg: "Login Failed ! please try again");
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/linkinPark.jpg"),
              fit: BoxFit.cover,
            )),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _signInButton(),
              SizedBox(
                height: 250,
              )
            ],
          ),
        ),
      ),
    );
  }
}
