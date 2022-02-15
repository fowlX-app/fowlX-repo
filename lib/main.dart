import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fowl_x/scrreens/login.dart';
import 'package:fowl_x/splash.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //static const String title = 'Home Page';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      );
}
