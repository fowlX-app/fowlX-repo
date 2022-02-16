import 'package:flutter/material.dart';

import 'home_page.dart';

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: MyTextPage());
  }
}

class MyTextPage extends StatelessWidget {
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
          title: const Text("About fowlx")),
      body: Container(
          child: ListView(
        children: const <Widget>[
          Image(image: AssetImage('assets/logos.jpg')),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              "The fowlX application is designed to\n simplify dail farm activities done on poultry farms\n it is an easy to learn and use mobile application which can be run on any smartphone.\n The features included in this application include:\n -record management\n - schedule management\n - tracking sales\n - And file management\n For any inquiry or information about fowlX contact us on:\n Email:info@fowlX.com",
            ),
          ),
        ],
      )),
    );
  }
}
