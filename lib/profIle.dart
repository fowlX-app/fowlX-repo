//import 'dart:math';

//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fowl_x/home_page.dart';
import 'package:flutter/material.dart';
//import 'package:footer/footer.dart';
//import 'package:footer/footer_view.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/cupertino.dart';

void main() {
  runApp(Container(
    color: Colors.orangeAccent,
  ));
  runApp(
    const Profile(),
  );
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();

    return MaterialApp(
//theme drawer***********
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.orange),
      ),
//Scffold and App bar*********
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                },
                icon: const Icon(Icons.arrow_back)),
            centerTitle: true,
            backgroundColor: Colors.orange,
            title: const Text(
              'Your Profile',
              textAlign: TextAlign.center,
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

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController farmnameController = TextEditingController();
  TextEditingController flockController = TextEditingController();

  CollectionReference _firestore =
      FirebaseFirestore.instance.collection('Prrofile');

  String? uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(10)),

            Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/download.png',
                      height: 150, width: 150),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text('First Name'),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 65,
                      width: 230,
                      child: TextField(
                        controller: firstnameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                      ),
                    ),
                    const Text('Last Name'),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 65,
                      width: 230,
                      child: TextField(
                        controller: lastnameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('e-mail'),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 75,
                      width: 360,
                      child: TextField(
                        controller: mailController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                      ),
                    ),

                    //highlightColor: Colors.orange
                  ],
                ),
                const Text('contact'),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 75,
                      width: 360,
                      child: TextField(
                        controller: contactController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text('Farm Name'),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 75,
                      width: 360,
                      child: TextField(
                        controller: farmnameController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.follow_the_signs_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      iconSize: 25,
                      color: Colors.orange,
                    ),
                  ],
                ),
                const Text('Flock reared'),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 75,
                      width: 360,
                      child: TextField(
                        controller: flockController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.indeterminate_check_box),
                          hintText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _firestore.doc(uid).set({
                          'FirstName': firstnameController.text,
                          'LastName': lastnameController.text,
                          'Email': mailController.text,
                          'Contact': contactController.text,
                          'Farm_name': farmnameController.text,
                          'Flock': flockController.text,
                        });
                      },
                      icon: const Icon(Icons.edit),
                      iconSize: 25,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      /* child: FooterView(children: const <Widget>[
          Padding(padding: EdgeInsets.all(200),
          ),r
        ],
        footer: Footer(child: const Text('GHGHH'),
        padding: const EdgeInsets.all(12),
        ),
        ),*/
    );
  }
}
