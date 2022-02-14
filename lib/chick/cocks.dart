import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fowl_x/database.dart';

class cockscreen extends StatefulWidget {
  const cockscreen({Key? key}) : super(key: key);

  @override
  State<cockscreen> createState() => Mycockscreen();
}

final _auth = FirebaseFirestore.instance;

class Mycockscreen extends State<cockscreen> {
  TextEditingController birdController = TextEditingController();
  TextEditingController purchasedControlller = TextEditingController();
  TextEditingController availablbeFeedsController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController feedsTodayController = TextEditingController();

  String estimatecalc(int numberOfChicks, int availableFeeds) {
    const double perChick = 0.05;
    double estimate = availableFeeds / (perChick * numberOfChicks);
    return estimate.toString();
  }

  double feed(double available, double used) {
    double differenceFeeds = available - used;
    return differenceFeeds;
  }

//late double _estimatedTime;

  @override
  Widget build(BuildContext context) {
    CollectionReference _fireStore2 =
        FirebaseFirestore.instance.collection('Cocks');
    String documentID = _fireStore2.doc().id;

    ThemeData(
      primaryColor: Colors.orange,
    );

    const Padding(padding: EdgeInsets.symmetric(horizontal: 75, vertical: 75));
    return Scaffold(
        body: ListView(children: [
      Column(
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(10.0)),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 150,
                height: 75,
                child: const Text('Amount of feeds purchased',
                    style: TextStyle(fontSize: 15)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 75,
                width: 220,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: purchasedControlller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        //borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                    //labelText: 'number of birds'
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(10.0)),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 150,
                height: 75,
                child: const Text('Feeds used today',
                    style: TextStyle(fontSize: 15)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 75,
                width: 220,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: feedsTodayController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        //borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                    //labelText: 'number of birds'
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(10.0)),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 150,
                height: 75,
                child: const Text('Amount of feeds available',
                    style: TextStyle(fontSize: 15)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 75,
                width: 220,
                child: TextField(
                  controller: availablbeFeedsController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(10.0)),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 150,
                height: 75,
                child: const Text('Number of cocks',
                    style: TextStyle(fontSize: 15)),
              ),
              Text(birdController.text),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 75,
                width: 220,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: birdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        //borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                    //labelText: 'number of birds'
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(10.0)),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 150,
                height: 75,
                child: const Text('Estimated Time',
                    style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 75.0,
            width: 175.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: Colors.orange,
                  onPrimary: Colors.white),
              onPressed: () {
                User? firebaseUser = FirebaseAuth.instance.currentUser;
                documentID = firebaseUser!.uid;
                print(documentID);
                // Time = estimatecalc();
                _fireStore2.doc(documentID).set({
                  'number_cocks': birdController.text,
                  'Available_feeds': availablbeFeedsController.text,
                  'feeds_used_today': feedsTodayController.text,
                  'Estimated_time': estimatecalc(int.parse(birdController.text),
                      int.parse(availablbeFeedsController.text)),
                  'Purchased_feeds': purchasedControlller.text,
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BirdsInfo()),
                );
                //print(_estimatedTime);
              },
              child: const Text("SAVE", style: TextStyle(fontSize: 15)),
            ),
          ),
        ],
      ),
    ]));
  }
}
