import 'package:flutter/material.dart';

import '../home_page.dart';

// ignore: use_key_in_widget_constructors
class NotificationScreen extends StatelessWidget {
  //const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Notifications'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
      );
}
