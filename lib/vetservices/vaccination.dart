import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Vaccines extends StatefulWidget {
  const Vaccines({Key? key}) : super(key: key);

  @override
  State<Vaccines> createState() => vaccine();
}

class vaccine extends State<Vaccines> {
  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    TextEditingController vaccinesController = TextEditingController();
    TextEditingController observationController = TextEditingController();
    TextEditingController henController = TextEditingController();
    TextEditingController chickController = TextEditingController();
    TextEditingController cockController = TextEditingController();

    String total(int cocks, int chicks, int hens) {
      int Total = cocks + hens + chicks;
      return Total.toString();
    }

    CollectionReference _firestore =
        FirebaseFirestore.instance.collection('vaccine_details');
    String docId = _firestore.doc().id;
    //User? user = FirebaseAuth.instance.currentUser;
    //docId = user!.uid;
    String? uid = FirebaseAuth.instance.currentUser!.uid;

    const Padding(padding: EdgeInsets.all(40.0));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccinations'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 75,
                width: 220,
                child: TextField(
                  //keyboardType: TextInputType.number,
                  controller: dateController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                      labelText: 'Vaccination Date'),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 75,
                width: 220,
                child: TextField(
                  // keyboardType: TextInputType.number,
                  controller: vaccinesController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                      labelText: 'Vaccine'),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 75,
                width: 220,
                child: TextField(
                  // keyboardType: TextInputType.number,
                  controller: observationController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                      labelText: 'Observation'),
                ),
              ),
              Text('Vaccinated'),
              Row(
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
                      _firestore.doc(uid).collection('vaccinesDetails').add({
                        'Date': dateController.text,
                        'Vaccine': vaccinesController.text,
                        'Total': total(
                            int.parse(cockController.text),
                            int.parse(chickController.text),
                            int.parse(henController.text)),
                        'Observation': observationController.text
                      });
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
