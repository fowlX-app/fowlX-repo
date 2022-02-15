import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fowl_x/chick/chick_details.dart';
import 'package:fowl_x/chick/cock_details.dart';
import 'package:fowl_x/scrreens/stock.dart';

class ChickScreen extends StatefulWidget {
  const ChickScreen({Key? key}) : super(key: key);

  @override
  State<ChickScreen> createState() => MyChickScreen();
}

final _auth = FirebaseAuth.instance;

class MyChickScreen extends State<ChickScreen> {
  TextEditingController birdController = TextEditingController();
  TextEditingController purchasedfeedController = TextEditingController();
  TextEditingController usedFeedController = TextEditingController();
  TextEditingController availableFeedsController = TextEditingController();

  String estimatecalc(int numberOfChicks, int availableFeeds) {
    const double perChick = 0.05;
    double estimate = availableFeeds / (perChick * numberOfChicks);
    return estimate.toString();
  }

  double feed(double available, double used) {
    available = available - used;
    return available;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    CollectionReference _fireStore =
        FirebaseFirestore.instance.collection('chicks');

    String documentID = _fireStore.doc().id;

    const Padding(padding: EdgeInsets.symmetric(horizontal: 75, vertical: 75));

    return MaterialApp(
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(primary: Colors.orange),
        ),
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => StockScreen()));
                    },
                    icon: const Icon(Icons.arrow_back)),
                title: const Text('Update Chick Feeds',
                    style: TextStyle(color: Colors.black))),
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
                        child: const Text('Amount of feeds purchased (kg)',
                            style: TextStyle(fontSize: 15)),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        height: 75,
                        width: 220,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: purchasedfeedController,
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
                        child: const Text('Feeds used today (kg)',
                            style: TextStyle(fontSize: 15)),
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
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(10.0)),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: 150,
                        height: 75,
                        child: const Text('Amount of feeds available (kg)',
                            style: TextStyle(fontSize: 15)),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        height: 75,
                        width: 220,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: availableFeedsController,
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
                            style: TextStyle(fontSize: 15)),
                      ),
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
                          'Available_feeds': availableFeedsController.text,
                          'number_of_chicks': birdController.text,
                          'Estimated_time': estimatecalc(
                              int.parse(birdController.text),
                              int.parse(availableFeedsController.text)),
                          'feeds_used_today': usedFeedController.text,
                          'Purchased_feeds': purchasedfeedController.text,
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ChicksInfo()),
                        );
                        // feedController.clear();
                      },
                      child: const Text("SAVE", style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ],
              ),
            ])));
  }
}
