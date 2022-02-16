import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fowl_x/chick/cocks.dart';
import 'package:fowl_x/home_page.dart';
import 'package:fowl_x/scrreens/records.dart';

class Uprecords extends StatelessWidget {
  const Uprecords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Records',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyRecordUpdate(title: 'Update your Records'),
    );
  }
}

class MyRecordUpdate extends StatefulWidget {
  const MyRecordUpdate({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyRecordUpdate> createState() => _MyRecordUpdateState();
}

class _MyRecordUpdateState extends State<MyRecordUpdate> {
  CollectionReference fireData =
      FirebaseFirestore.instance.collection('salesComputations');
  CollectionReference fireData1 =
      FirebaseFirestore.instance.collection('expensesComputations');
  CollectionReference _fireData2 =
      FirebaseFirestore.instance.collection('eggComputations');
  CollectionReference fireData13 =
      FirebaseFirestore.instance.collection('Population');

  String? uid = FirebaseAuth.instance.currentUser!.uid;

  TextEditingController salesController = TextEditingController();
  TextEditingController expensesController = TextEditingController();
  TextEditingController eggController = TextEditingController();
  TextEditingController henController = TextEditingController();
  TextEditingController chickController = TextEditingController();
  TextEditingController cockController = TextEditingController();

  int Wtotal = 0;
  int Mtotal = 0;
  int Ytotal = 0;
  String Weekly(int sales) {
    Wtotal += sales;
    return Wtotal.toString();
  }

  String Monthly(int Weeklytotal) {
    Mtotal += Weeklytotal;
    return Mtotal.toString();
  }

  String Yearly(int mothlyTotal) {
    int Ytotal = 0;
    Ytotal += mothlyTotal;
    return Ytotal.toString();
  }

  String total(int cocks, int chicks, int hens) {
    int Total = cocks + hens + chicks;
    return Total.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const RecordScreen()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.orange,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('after filling in an update, click save button'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                hoverColor: Colors.orange,
                tileColor: Colors.orange,
                //onLongPress: ,
                leading: Container(
                  height: 45,
                  child: const Image(
                    image: AssetImage(
                      'assets/m5.png',
                    ),
                  ),
                ),
                /*IconButton(
                onPressed: () {},
                icon: Icon(Icons.money_outlined, size: 40),
              ),*/

                title: const Text(
                  'Sales',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                subtitle: Column(
                  children: <Widget>[
                    const Text("input sales made today",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    const Padding(padding: EdgeInsets.all(5)),
                    TextField(
                      controller: salesController,
                      keyboardType: TextInputType.number,
                      cursorHeight: 25,
                      //controller:
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  child: ElevatedButton(
                    child: const Text('SAVE'),
                    onPressed: () {
                      fireData.doc(uid).set({
                        'Day': salesController.text,
                        'Week': Weekly(int.parse(salesController.text)),
                        'Month': Monthly(Wtotal),
                        'Year': Yearly(Mtotal),
                      });
                    },
                  ),
                ),
              ),
            ),
            /********************************************************* */
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                hoverColor: Colors.orange,
                tileColor: Colors.orange,
                //onLongPress: ,
                leading: Container(
                  height: 45,
                  child: const Image(
                    image: AssetImage(
                      'assets/m5.png',
                    ),
                  ),
                ),
                /*IconButton(
                onPressed: () {},
                icon: Icon(Icons.money_outlined, size: 40),
              ),*/

                title: const Text(
                  'Expenses',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                ),
                subtitle: Column(
                  children: <Widget>[
                    const Text("input today's money spent",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    const Padding(padding: const EdgeInsets.all(5)),
                    TextField(
                      controller: expensesController,
                      keyboardType: TextInputType.number,
                      cursorHeight: 25,
                      //controller:
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  child: ElevatedButton(
                    child: const Text('SAVE'),
                    onPressed: () {
                      fireData1.doc(uid).set({
                        'Day': expensesController.text,
                        'Week': Weekly(int.parse(expensesController.text)),
                        'Month': Monthly(Wtotal),
                        'Year': Yearly(Mtotal),
                      });
                    },
                  ),
                ),
              ),
            ),
            //************************************************************************* */
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                hoverColor: Colors.orange,
                tileColor: Colors.orange,
                //onLongPress: ,
                leading: Container(
                  height: 45,
                  child: const Image(
                    image: AssetImage(
                      'assets/m5.png',
                    ),
                  ),
                ),
                /*IconButton(
                onPressed: () {},
                icon: Icon(Icons.money_outlined, size: 40),
              ),*/

                title: const Text(
                  'Eggs collected',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                ),
                subtitle: Column(
                  children: <Widget>[
                    const Text("input today's money spent",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    const Padding(padding: const EdgeInsets.all(5)),
                    TextField(
                      controller: eggController,
                      keyboardType: TextInputType.number,
                      cursorHeight: 25,
                      //controller:
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  child: ElevatedButton(
                    child: const Text('SAVE'),
                    onPressed: () {
                      _fireData2.doc(uid).set({
                        'Day': eggController.text,
                        'Week': Weekly(int.parse(eggController.text)),
                        'Month': Monthly(Wtotal),
                        'Year': Yearly(Mtotal),
                      });
                    },
                  ),
                ),
              ),
            ),
            //************************************************************************ */
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('Flock Monitor ▶️',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                hoverColor: Colors.orange,
                tileColor: Colors.orange,
                //onLongPress: ,
                leading: Container(
                  height: 45,
                  child: const Image(
                    image: AssetImage(
                      'assets/henpng2.png',
                    ),
                  ),
                ),
                /*IconButton(
                onPressed: () {},
                icon: Icon(Icons.money_outlined, size: 40),
              ),*/

                title: const Text(
                  'Number of birds this time',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                ),
                subtitle: Column(
                  children: <Widget>[
                    const Text(
                      'Chicks',
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    TextField(
                      controller: chickController,
                      keyboardType: TextInputType.number,
                      cursorHeight: 25,
                      //controller:
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    const Text(
                      'Cocks',
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    TextField(
                      controller: cockController,
                      keyboardType: TextInputType.number,
                      cursorHeight: 25,
                      //controller:
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    const Text(
                      'Hens',
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    TextField(
                      controller: henController,
                      keyboardType: TextInputType.number,
                      cursorHeight: 25,
                      //controller:
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  child: ElevatedButton(
                    child: const Text('SAVE'),
                    onPressed: () {
                      fireData13.doc(uid).set({
                        'Hens': cockController.text,
                        'Cocks': chickController.text,
                        'Chicks': chickController.text,
                        'Total': total(
                            int.parse(chickController.text),
                            int.parse(cockController.text),
                            int.parse(henController.text)),
                      });
                    },
                  ),
                ),
              ),
            ),
            //************************************************************** */
          ],
        ),
      ),
    );
  }
}
