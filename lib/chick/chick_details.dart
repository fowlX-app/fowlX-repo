import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fowl_x/chick/chick.dart';
import 'package:fowl_x/home_page.dart';

class ChicksInfo extends StatefulWidget {
  @override
  ChickInfo createState() => ChickInfo();
}

class ChickInfo extends State<ChicksInfo> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference _firebase =
        FirebaseFirestore.instance.collection('chicks');

    User? user = FirebaseAuth.instance.currentUser;

    ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange),
      home: Scaffold(
        body: Container(
          child: StreamBuilder(
            stream: _firebase.snapshots(),
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
                          'Chick Feeds',
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
                                  Text(doc['number_of_chicks'],
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
        persistentFooterButtons: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ChickScreen()));
            },
            icon: const Icon(Icons.edit),
            iconSize: 30,
            color: Colors.orange,
          )
        ],
      ),
    );
  }
}
