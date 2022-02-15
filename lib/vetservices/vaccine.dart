import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fowl_x/vetservices/vacc_form.dart';

class MyBirds extends StatefulWidget {
  @override
  _MyBirdInfo createState() => _MyBirdInfo();
}

class _MyBirdInfo extends State<MyBirds> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String? uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference firebase = FirebaseFirestore.instance
        .collection('vaccine_details')
        .doc(uid)
        .collection('vaccinesDetails');
    //String docId = firebase.doc().id;
    //User? user = FirebaseAuth.instance.currentUser;
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
            // Container(
            SizedBox(
              height: 800.0,
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
                              'Vaccination Details',
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
                                      Text('Date:'),
                                      Text('Vaccine:'),
                                      Text('Total:'),
                                      Text('Observation:'),
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

            //),
            const Padding(padding: EdgeInsets.all(40)),
          ],
        ),
        persistentFooterButtons: <Widget>[
          const Text(
            'EDIT',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.orange,
              size: 35,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Vaccines()),
            ),
          ),
        ],
      ),
    );
  }
}
