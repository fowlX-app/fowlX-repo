import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BirdsInfo extends StatefulWidget {
  @override
  BirdInfo createState() => BirdInfo();
}

class BirdInfo extends State<BirdsInfo> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference firebase =
        FirebaseFirestore.instance.collection('hens');
    String docId = firebase.doc().id;
    User? user = FirebaseAuth.instance.currentUser;
    //String documentID = firebase.doc().id;
    //documentID = user!.uid;

    ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.white),
      ),
      home: Scaffold(
        appBar: AppBar(
            title:
                const Text('My Feeds', style: TextStyle(color: Colors.black))),
        body: Container(
          child: StreamBuilder(
            stream: firebase.snapshots(),
            builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var doc = snapshot.data!.docs[index];
                      return ListTile(
                        hoverColor: Colors.orange,
                        tileColor: Colors.orange,
                        //onLongPress: ,
                        leading: Container(
                          height: 60,
                          child: const Image(
                            image: AssetImage(
                              'assets/henpng2.png',
                            ),
                          ),
                        ),
                        title: const Text(
                          'Layer Feeds',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),

                        subtitle: Container(
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text('Number of Birds:'),
                                  Text('Available feeds:'),
                                  Text('Purchased feeds:'),
                                  Text('Estimate time:'),
                                  Text('Used feeds:'),
                                ],
                              ),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(40, 0, 50, 0)),
                              Column(
                                children: [
                                  Text(doc['number_layers'],
                                      style:
                                          const TextStyle(color: Colors.black)),
                                  Text(doc['Available_feeds'],
                                      style:
                                          const TextStyle(color: Colors.black)),
                                  Text(doc['Purchased_feeds'],
                                      style:
                                          const TextStyle(color: Colors.black)),
                                  Text(doc['Estimated_time'],
                                      style:
                                          const TextStyle(color: Colors.black)),
                                  Text(doc['feeds_used_today'],
                                      style:
                                          const TextStyle(color: Colors.black))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Text('');
              }
            },
          ),
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
