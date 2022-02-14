import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Building Layouts with FLutter'),
        ),
        body: const Center(
          child: Text(
            'Hello Flutter Layouts',
            style: TextStyle(fontSize: 24),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('You clicked');
          },
          child: const Icon(Icons.lightbulb_outline),
        ),
        persistentFooterButtons: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.alarm),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_location),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
