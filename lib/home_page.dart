import 'package:flutter/material.dart';
import 'package:fowl_x/drawer.dart';
import 'package:fowl_x/help_page.dart';
import 'package:fowl_x/profIle.dart';
import 'package:fowl_x/scrreens/notifications.dart';
import 'package:fowl_x/scrreens/records.dart';
import 'package:fowl_x/scrreens/sales.dart';

import 'package:fowl_x/scrreens/stock.dart';
import 'package:fowl_x/vetservices/medicine.dart';

class HomeScreen extends StatelessWidget {
  static const String title = 'Home Page';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: MainPage(),
      );
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Poultry Manager',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          actions: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                //backgroundColor: Color(),
                dividerColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.white),
                textTheme: const TextTheme().apply(bodyColor: Colors.black),
              ),
              child: PopupMenuButton<int>(
                color: Colors.white,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: const [
                        Icon(Icons.help, color: Colors.orange),
                        SizedBox(width: 8),
                        Text('Help',
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: const [
                        Icon(Icons.info, color: Colors.orange),
                        SizedBox(width: 8),
                        Text(
                          'About',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: const [
                        Icon(Icons.logout, color: Colors.orange),
                        SizedBox(width: 8),
                        Text(
                          'Sign Out',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: drawer(),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/hen.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.home,
                        size: 42,
                        color: Colors.orange,
                      ),
                      const Text('HOME',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.fromLTRB(70, 0, 70, 0)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: Colors.orange,
                              onPrimary: Colors.white),
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => NotificationScreen()),
                              ),
                          clipBehavior: Clip.antiAlias,
                          child: const Icon(
                            Icons.notifications_active,
                            size: 55,
                          )),
                    ],
                  ),
                ),

                // /*color: Colors.white,
                Column(children: <Widget>[
                  const Padding(padding: EdgeInsets.all(30)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.receipt_long_rounded,
                          size: 70,
                          color: Colors.orange,
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 70.0,
                          width: 200.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.orange,
                                onPrimary: Colors.white),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => RecordScreen()),
                            ),
                            child: Row(
                              children: const <Widget>[
                                Text("RECORDS", style: TextStyle(fontSize: 20)),
                                Icon(Icons.arrow_forward_rounded),
                              ],
                            ),
                          ),
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.pets,
                        size: 70,
                        color: Colors.orange,
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 70.0,
                        width: 200.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: Colors.orange,
                              onPrimary: Colors.white),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => VetScreen()),
                          ),
                          child: Row(
                            children: const <Widget>[
                              Text("VET ROOM", style: TextStyle(fontSize: 20)),
                              Icon(Icons.arrow_forward_rounded),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.delivery_dining_rounded,
                          size: 70,
                          color: Colors.orange,
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 70.0,
                          width: 200.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.orange,
                                onPrimary: Colors.white),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SalesScreen()),
                            ),
                            child: Row(
                              children: const <Widget>[
                                Text("PRODUCTION",
                                    style: TextStyle(fontSize: 20)),
                                Icon(Icons.arrow_forward_rounded),
                              ],
                            ),
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.trending_up_rounded,
                          size: 70,
                          color: Colors.orange,
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 70.0,
                          width: 200.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.orange,
                                onPrimary: Colors.white),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => StockScreen()),
                            ),
                            child: Row(
                              children: const <Widget>[
                                Text("STOCK", style: TextStyle(fontSize: 20)),
                                Icon(Icons.arrow_forward_rounded),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ]),
              ],
            )),
        persistentFooterButtons: <Widget>[
          const Text(
            '©️fowlX2022 all rights reserved   ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      );

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Profile()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HelpPage()),
        );
        break;
      /*case 2:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false,
        );*/
    }
  }
}
