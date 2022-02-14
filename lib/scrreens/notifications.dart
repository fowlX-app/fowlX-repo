import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class NotificationScreen extends StatelessWidget {
  //const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
      );
}
