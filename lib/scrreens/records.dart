import 'package:flutter/material.dart';
import 'package:fowl_x/home_page.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            icon: const Icon(Icons.arrow_back)),
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
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {},
                //**************************************************************listtile */
                child: ListTile(
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
                  /*IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.money_outlined, size: 40),
                 ),*/

                  title: const Text(
                    'My sales',
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
                            Text('This day:'),
                            Text('This Week:'),
                            Text('This Month:'),
                            Text('This Year:'),
                          ],
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(40, 0, 50, 0)),
                        Column(
                          children: const [
                            Text('amount'),
                            Text('amount'),
                            Text('amount'),
                            Text('amount'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //************************************************************************ */
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {},
                child: ListTile(
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
                  /*IconButton(
                onPressed: () {},
                icon: Icon(Icons.money_outlined, size: 40),
              ),*/

                  title: const Text(
                    'My Expenses',
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
                            Text('This day:'),
                            Text('This Week:'),
                            Text('This Month:'),
                            Text('This Year:'),
                          ],
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(40, 0, 50, 0)),
                        Column(
                          children: const [
                            Text('amount'),
                            Text('amount'),
                            Text('amount'),
                            Text('amount'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /*************************************************************************** */
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {},
                child: ListTile(
                  hoverColor: Colors.orange,
                  tileColor: Colors.orange,
                  //onLongPress: ,
                  leading: Container(
                    height: 60,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('This day:'),
                            Text('This Week:'),
                            Text('This Month:'),
                            Text('This Year:'),
                          ],
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(40, 0, 50, 0)),
                        Column(
                          children: const [
                            Text('amount'),
                            Text('amount'),
                            Text('amount'),
                            Text('amount'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
/************************************************************************** */
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {},
                child: ListTile(
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
                  /*IconButton(
                onPressed: () {},
                icon: Icon(Icons.money_outlined, size: 40),
              ),*/

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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('Total Birds:'),
                            Text('Cocks:'),
                            Text('Hens:'),
                            Text('Chicks:'),
                          ],
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(40, 0, 50, 0)),
                        Column(
                          children: const [
                            Text('amount'),
                            Text('amount'),
                            Text('amount'),
                            Text('amount'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
