import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  late SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();

    if (isLogedin) {
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }

    setState(() {
      loading = false;
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    Fluttertoast.showToast(msg: "Iniciado sesión correctamente");
    setState(() {
      loading = false;
    });

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future handleSignIn() async{
  //
  //   Future<UserCredential> firebaseUser = signInWithGoogle();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Colors.orange,
      //   title: Center(child: Image.asset('assets/logo.png', fit: BoxFit.contain, height: 45)),
      // ),
      body: Stack(
        children: [

          SafeArea(
            child: Image.asset("assets/logo-transparente.png",
                fit: BoxFit.cover, width: double.infinity),
          ),
          Container(
            alignment: Alignment.center,
            child: Center(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 330.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange.withOpacity(0.4),
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.mail),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailTextController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern.toString());
                                    if (!regex.hasMatch(value))
                                      return 'Introduzca un email válido';
                                    else
                                      return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange.withOpacity(0.4),
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                style: TextStyle(decoration: TextDecoration.none),
                                decoration: InputDecoration(
                                  hintText: "Contraseña",
                                  icon: Icon(Icons.lock),
                                  border: InputBorder.none,
                                  //decoration: InputDecoration( border: InputBorder. none, hintText: "TextInput without Underline"
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                controller: _passwordTextController,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Debes introducir tu contraseña";
                                  } else if (value.length < 6){
                                    return "La contraseña es demasiado corta, debe superar los 6 caracteres";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.withOpacity(0.8),
                            elevation: 0,
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text("Iniciar sesión", textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                                ),
                            ),
                          ),
                        ),

                        Divider(color: Colors.black),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red.shade800,
                            elevation: 0,
                            child: MaterialButton(
                              onPressed: () {
                                signInWithGoogle();
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Iniciar sesión con Google",
                                style: TextStyle(color: Colors.white),
                              ),
                              //color: Colors.red.shade800,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: Container(
      //   child: Padding(
      //     padding: const EdgeInsets.only(
      //         left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
      //     child: FlatButton(
      //       onPressed: () {
      //         signInWithGoogle();
      //       },
      //       child: Text(
      //         "Iniciar sesión con Google",
      //         style: TextStyle(color: Colors.white),
      //       ),
      //       color: Colors.red.shade800,
      //     ),
      //   ),
      // ),
    );
  }
}
