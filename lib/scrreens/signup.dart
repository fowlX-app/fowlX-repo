//import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fowl_x/home_page.dart';
import 'package:fowl_x/services/auth_services.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();

    return MaterialApp(
//theme drawer*****************************
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.orange),
      ),
//Scffold and App bar*********************
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.orange,
            title: const Text(
              'Welcome 🐔 sign up',
              style: TextStyle(fontSize: 30.0),
            )),
        backgroundColor: Colors.orange,
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

final _auth = FirebaseAuth.instance;

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController farmnameController = TextEditingController();
  TextEditingController noOfHensController = TextEditingController();
  TextEditingController typeOfHens = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  late String email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    CollectionReference firestore =
        FirebaseFirestore.instance.collection('profile');
    String documentID;
    var firebaseUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      extendBody: true,
      body: Center(
        child: ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(10)),

            const CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.orange,
              child: Icon(
                Icons.account_box,
                size: 50,
                color: Colors.white,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 75,
                  width: 200,
                  child: TextField(
                    controller: firstnameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        labelText: 'First Name'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 75,
                  width: 200,
                  child: TextField(
                    controller: lastnameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        labelText: 'Last Name'),
                  ),
                ),
              ],
            ),

            //),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 75,
                  width: 200,
                  child: TextField(
                    maxLength: 9,
                    keyboardType: TextInputType.number,
                    controller: contactController,
                    decoration: const InputDecoration(
                        counterText: '',
                        prefix: Padding(
                          padding: EdgeInsets.all(3),
                          child: Text('+256'),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        labelText: 'Contact'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 75,
                  width: 200,
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    controller: mailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        labelText: 'E-mail'),
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              height: 75,
              width: 2000,
              child: TextField(
                maxLength: 15,
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  counterText: '',
                  hintText: 'New Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              height: 75,
              width: 2000,
              child: TextField(
                maxLength: 15,
                onChanged: (value) {
                  _password = value;
                },
                obscureText: true,
                controller: password2,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  counterText: '',
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.fromLTRB(90, 0, 90, 0),
              child: ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () async {
                  var firebaseUser = await FirebaseAuth.instance.currentUser;
                  if (mailController.text == '' || password.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('All feields are required'),
                      backgroundColor: Colors.orange,
                    ));
                  } else if (password.text != password2.text) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Passwords dont match'),
                      backgroundColor: Colors.orange,
                    ));
                  } else {
                    User? result = (await AuthService()
                        .register(mailController.text, password.text));
                    if (result != null) {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: _password)
                          .then((signedInUser) {
                        /*UserManagement()
                            .storeNewUser(signedInUser.user, context);*/
                        /*firestore.doc(firebaseUser!.uid).set({
                          'lastname': lastnameController.text,
                          'firstname': firstnameController.text,
                          'contact': contactController.text,
                          'email': mailController.text,
                        });*/
                        firestore
                            .doc(firebaseUser!.uid)
                            .collection('profile')
                            .add({
                          'lastname': lastnameController.text,
                          'firstname': firstnameController.text,
                          'contact': contactController.text,
                          'email': mailController.text,
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      }).catchError((e) {
                        print(e);
                      });
                    }
                  }
                  print(firstnameController.text);
                  // ignore: avoid_print
                  print(lastnameController.text);
                  print(contactController.text);
                  print(mailController.text);
                  print(farmnameController.text);
                  print(noOfHensController.text);
                  print(typeOfHens.text);
                  print(password.text);
                },
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }
}
