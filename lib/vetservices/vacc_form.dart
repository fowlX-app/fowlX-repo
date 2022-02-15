import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fowl_x/vetservices/medicine.dart';
import 'package:fowl_x/vetservices/vaccine.dart';
import 'package:fowl_x/vetservices/med_form.dart';

class Vaccines extends StatefulWidget {
  const Vaccines({Key? key}) : super(key: key);

  @override
  State<Vaccines> createState() => vaccine();
}

class vaccine extends State<Vaccines> {
  set Date(DateTime Date) {}

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    DateTime date;
    late DateTime _selectedDate;
    DateTime? newSelectedDate;
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
          title: const Text('Vaccination to take place'),
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
                    controller: dateController,
                    // keyboardType: TextInputType.datetime,
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
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.today_rounded,
                        ),
                        border: OutlineInputBorder(
                            //borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                        labelText: 'Vaccination Date'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 75,
                  width: 400,
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    controller: vaccinesController,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.add,
                        ),
                        border: OutlineInputBorder(
                            //borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                        labelText: 'Vaccine'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 75,
                  width: 400,
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    controller: observationController,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.panorama_fish_eye_rounded),
                        border: OutlineInputBorder(
                            //borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                        labelText: 'Observation'),
                  ),
                ),
                const Text('Vaccinated;',
                    style: TextStyle(fontStyle: FontStyle.italic)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        _firestore.doc(uid).collection('vaccinesDetails').add({
                          'Date': dateController.text,
                          'Vaccine': vaccinesController.text,
                          'Total': total(
                              int.parse(cockController.text),
                              int.parse(chickController.text),
                              int.parse(henController.text)),
                          'Observation': observationController.text
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => MyBirds()));
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

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
