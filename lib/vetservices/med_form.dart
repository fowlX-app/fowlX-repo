import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fowl_x/vetservices/medic.dart';
import 'package:fowl_x/vetservices/medicine.dart';

class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  State<Medicine> createState() => medicine();
}

class medicine extends State<Medicine> {
  @override
  Widget build(BuildContext context) {
    DateTime date;
    late DateTime _selectedDate;
    DateTime? newSelectedDate;
    TextEditingController dateController = TextEditingController();
    TextEditingController medicineController = TextEditingController();
    TextEditingController observationController = TextEditingController();
    TextEditingController henController = TextEditingController();
    TextEditingController chickController = TextEditingController();
    TextEditingController cockController = TextEditingController();

    String total(int cocks, int chicks, int hens) {
      int Total = cocks + hens + chicks;
      return Total.toString();
    }

    CollectionReference _firestore =
        FirebaseFirestore.instance.collection('medical_details');

    String? uid = FirebaseAuth.instance.currentUser!.uid;

    const Padding(padding: EdgeInsets.all(40.0));
    ThemeData theme = ThemeData();

    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.orange),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => VetScreen()));
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Medication to take place'),
          backgroundColor: Colors.orange,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 75,
                  width: 400,
                  child: TextField(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2055))
                          .then((date) {
                        setState(() {
                          newSelectedDate = date;
                        });
                      });
                    },
                    keyboardType: TextInputType.datetime,
                    controller: dateController,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.today_rounded,
                        ),
                        border: OutlineInputBorder(
                            //borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                        labelText: 'Medication Date'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 75,
                  width: 400,
                  child: TextField(
                    controller: medicineController,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.add,
                        ),
                        border: OutlineInputBorder(
                            //borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                        labelText: 'Medication'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 75,
                  width: 400,
                  child: TextField(
                    controller: observationController,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.panorama_fish_eye_rounded),
                        border: OutlineInputBorder(
                            //borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                        labelText: 'Observation'),
                  ),
                ),
                const Text(
                  'Apply to;',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Cocks'),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 75,
                      width: 220,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: cockController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              //borderRadius: BorderRadius.all(Radius.circular(24)),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Hens'),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 75,
                      width: 220,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: henController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              //borderRadius: BorderRadius.all(Radius.circular(24)),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Chicks'),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 75,
                      width: 220,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: chickController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              //borderRadius: BorderRadius.all(Radius.circular(24)),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 175.0,
                    height: 75.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.orange,
                          onPrimary: Colors.white),
                      onPressed: () {
                        _firestore.doc(uid).collection('medicineDetails').add({
                          'Date': dateController.text,
                          'Medication': medicineController.text,
                          'Total': total(
                              int.parse(cockController.text),
                              int.parse(henController.text),
                              int.parse(chickController.text))
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Birds()));
                      },
                      child: const Text("SAVE", style: TextStyle(fontSize: 15)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 175.0,
                    height: 75.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.orange,
                          onPrimary: Colors.white),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => VetScreen()));
                      },
                      child:
                          const Text("CANCEL", style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
