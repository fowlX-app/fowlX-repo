import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RecordScreen()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.orange,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
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
              padding: EdgeInsets.all(10),
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
                  children: const <Widget>[
                    Text("input sales made today",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.all(5)),
                    TextField(
                      keyboardType: TextInputType.number,
                      cursorHeight: 25,
                      //controller:
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  child: ElevatedButton(
                    child: Text('SAVE'),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            /********************************************************* */
            Padding(
              padding: EdgeInsets.all(10),
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
                  children: const <Widget>[
                    Text("input today's money spent",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.all(5)),
                    TextField(
                      keyboardType: TextInputType.number,
                      cursorHeight: 25,
                      //controller:
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  child: ElevatedButton(
                    child: Text('SAVE'),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            //************************************************************************* */
            Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                hoverColor: Colors.orange,
                tileColor: Colors.orange,
                //onLongPress: ,
                leading: Container(
                  height: 45,
                  child: const Image(
                    image: AssetImage(
                      'assets/eggpng.png',
                    ),
                  ),
                ),
                /*IconButton(
                onPressed: () {},
                icon: Icon(Icons.money_outlined, size: 40),
              ),*/

                title: const Text(
                  'Eggs Collection',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                ),
                subtitle: Column(
                  children: const <Widget>[
                    Text("input eggs collected today",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.all(5)),
                    TextField(
                      keyboardType: TextInputType.number,
                      cursorHeight: 25,
                      //controller:
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  child: ElevatedButton(
                    child: Text('SAVE'),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            //************************************************************************ */
            // const Padding(
            //   padding: EdgeInsets.all(20),
            //   child: Text('Flock Monitor ▶️',
            //       style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            // ),

            //Padding(
            //padding: EdgeInsets.all(10),
            // ),
          ],
        ),
      ),
    );
  }
}
