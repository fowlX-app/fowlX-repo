import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fowl_x/vetservices/vet.dart';

class Birds extends StatefulWidget {
  @override
  _BirdInfo createState() => _BirdInfo();
}

class _BirdInfo extends State<Birds> {
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
        body: ListView(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 175.0,
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
                                'Medication details',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),

                              subtitle: Container(
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text('Number of Birds:'),
                                        Text('Available feeds:'),
                                        Text('Purchased feeds:'),
                                        Text('Estimate time:'),
                                        Text('Used feeds:'),
                                      ],
                                    ),
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(40, 0, 50, 0)),
                                    Column(
                                      children: [
                                        Text(doc['Date'],
                                            style: const TextStyle(
                                                color: Colors.black)),
                                        Text(doc['Vaccine'],
                                            style: const TextStyle(
                                                color: Colors.black)),
                                        Text(doc['Total'],
                                            style: const TextStyle(
                                                color: Colors.black)),
                                        Text(doc['Observation'],
                                            style: const TextStyle(
                                                color: Colors.black)),
                                        // Text(doc['feeds_used_today'],
                                        //     style: const TextStyle(
                                        //         color: Colors.black))
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
              ),
            ),
            const Padding(padding: EdgeInsets.all(40)),
          ],
        ),
        persistentFooterButtons: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Medicine()),
            ),
          ),
        ],
      ),
    );
  }
}
