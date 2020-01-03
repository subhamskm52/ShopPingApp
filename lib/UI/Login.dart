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

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    setState(() {
      isSignedIn();
    });
    setState(() {
      isLoggedIn;
    });
    if (isLoggedIn == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                    id,
                    username,
                    email,
                    photoUrl,
                    title: "Shop Stop",
              )
          )
      );
    }
  }

  Future<bool> isSignedIn() async {
    isLoggedIn = await googleSignIn.isSignedIn();
    return isLoggedIn;
  }

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
      preferences.setString("id", user.uid);
      preferences.setString("username", user.displayName);
      preferences.setString("email", user.email);
      preferences.setString("photoUrl", user.photoUrl);
      id = user.uid;
      username = user.displayName;
      email = user.email;
      photoUrl = user.photoUrl;
      isLoggedIn = true;
      print('signInWithGoogle succeeded: $user');
    } catch (error) {
      print("error in logging in");
      isLoggedIn = false;
    }
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
                  builder: (context) => MyHomePage(
                      id, username, email, photoUrl,
                      title: "Stop Shop")));
        } else {
          Fluttertoast.showToast(msg: "Login Failed ! please try again");
        }
      },
    );
  }
}
