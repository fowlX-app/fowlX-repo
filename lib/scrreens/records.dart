import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fowl_x/home_page.dart';
import 'package:fowl_x/updaterecords.dart';

// ignore: use_key_in_widget_constructors
class RecordScreen extends StatelessWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Updated Records',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyRecords(title: 'My Records'),
    );
  }
}

class MyRecords extends StatefulWidget {
  const MyRecords({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyRecords> createState() => _MyRecordsState();
}

class _MyRecordsState extends State<MyRecords> {
  CollectionReference _firestore =
      FirebaseFirestore.instance.collection('Sales');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                height: 175,
                child: ElevatedButton(
                  onPressed: () {},
                  child: StreamBuilder(
                    stream: _firestore.snapshots(),
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
                                      'assets/m5.png',
                                    ),
                                  ),
                                ),
                                title: const Text(
                                  'Sales',
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
                                          Text('This Day:'),
                                          Text('This Week'),
                                          Text('This Month'),
                                          Text('This Year:'),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              40, 0, 50, 0)),
                                      Column(
                                        children: [
                                          Text(doc['Day'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Week'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Month'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Year'],
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
              ),
            ),

            //************************************************************************ */
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                height: 175.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: StreamBuilder(
                    stream: _firestore.snapshots(),
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
                                      'assets/m5.png',
                                    ),
                                  ),
                                ),
                                title: const Text(
                                  'Expenses',
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
                                          Text('This Day:'),
                                          Text('This Week'),
                                          Text('This Month'),
                                          Text('This Year:'),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              40, 0, 50, 0)),
                                      Column(
                                        children: [
                                          Text(doc['Day'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Week'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Month'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Year'],
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
              ),
            ),

            /*************************************************************************** */
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                height: 175.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: StreamBuilder(
                    stream: _firestore.snapshots(),
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
                                      'eggpng.png',
                                    ),
                                  ),
                                ),
                                title: const Text(
                                  'Eggs Collected',
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
                                          Text('This Day:'),
                                          Text('This Week'),
                                          Text('This Month'),
                                          Text('This Year:'),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              40, 0, 50, 0)),
                                      Column(
                                        children: [
                                          Text(doc['Day'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Week'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Month'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Year'],
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
              ),
            ),
/************************************************************************** */
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                height: 175,
                child: ElevatedButton(
                  onPressed: () {},
                  child: StreamBuilder(
                    stream: _firestore.snapshots(),
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
                                      'assets/henpng.png',
                                    ),
                                  ),
                                ),
                                title: const Text(
                                  'Flock',
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
                                          Text('Total:'),
                                          Text('Hens'),
                                          Text('Chicks'),
                                          Text('Cocks'),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              40, 0, 50, 0)),
                                      Column(
                                        children: [
                                          Text(doc['Day'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Week'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Month'],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          Text(doc['Year'],
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
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        const Text(
          'UPDATE',
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
            MaterialPageRoute(builder: (_) => const Uprecords()),
          ),
        ),
      ],
    );
  }
}
