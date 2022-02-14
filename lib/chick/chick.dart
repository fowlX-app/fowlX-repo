import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChickScreen extends StatefulWidget {
  const ChickScreen({Key? key}) : super(key: key);

  @override
  State<ChickScreen> createState() => MyChickScreen();
}

final _auth = FirebaseAuth.instance;

class MyChickScreen extends State<ChickScreen> {
  TextEditingController birdController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController feedController = TextEditingController();
  TextEditingController usedFeedController = TextEditingController();
  TextEditingController NumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference _fireStore =
        FirebaseFirestore.instance.collection('chicks');
    /*CollectionReference _fireStore =
        FirebaseFirestore.instance.collection('_fireStore');*/
    String documentID = _fireStore.doc().id;

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
                    style: TextStyle(fontSize: 17)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 75,
                width: 220,
                child: TextField(
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
                child: const Text('Amount of feeds available',
                    style: TextStyle(fontSize: 17)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 75,
                width: 220,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: feedController,
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
                child: const Text('Number of Chicks',
                    style: TextStyle(fontSize: 19)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 75,
                width: 220,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: NumberController,
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
                    style: TextStyle(fontSize: 20)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 75,
                width: 220,
                child: TextField(
                  controller: timeController,
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
          Container(
            padding: const EdgeInsets.all(10.0),
            child:
                const Text('Feeds used today', style: TextStyle(fontSize: 20)),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: 75,
            width: 220,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: usedFeedController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    //borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                //labelText: 'number of birds'
              ),
            ),
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
              onPressed: () async {
                User? firebaseUser = FirebaseAuth.instance.currentUser;
                documentID = firebaseUser!.uid;
                print(documentID);
                _fireStore.doc(documentID).set({
                  'feeds': feedController.text,
                  'number_of_chicks': NumberController.text,
                  'Estimated_time': timeController.text,
                  'Used_feeds': usedFeedController.text,
                  'Number_of_birds': birdController.text,
                });

                // feedController.clear();
              },
              child: const Text("SAVE", style: TextStyle(fontSize: 15)),
            ),
          ),
        ],
      ),
    ]));
  }
}
