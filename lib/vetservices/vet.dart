import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fowl_x/vetservices/medic.dart';

class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  State<Medicine> createState() => medicine();
}

class medicine extends State<Medicine> {
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medications'),
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
                  keyboardType: TextInputType.number,
                  controller: dateController,
                  decoration: const InputDecoration(
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
                  keyboardType: TextInputType.number,
                  controller: medicineController,
                  decoration: const InputDecoration(
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
                  keyboardType: TextInputType.number,
                  controller: observationController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                      labelText: 'Observation'),
                ),
              ),
              Text('Apply to'),
              Row(
                children: [
                  const Text('Cocks'),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
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
                children: [
                  const Text('Hens'),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 10, 10, 10),
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
                children: [
                  const Text('Chicks'),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 10, 10, 10),
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
              Row(children: [
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
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Birds()));
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
                    onPressed: () {},
                    child: const Text("CANCEL", style: TextStyle(fontSize: 15)),
                  ),
                ),
              ]),
            ],
          )
        ],
      ),
    );
  }
}
