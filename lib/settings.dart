// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'home_page.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fowlX',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Settings'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;

  get titlePadding => null;
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
        title: Text(widget.title),
        backgroundColor: Colors.orange,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            //titlePadding: EdgeInsets.all(20),
            title: Text(
              'GENERAL',
              style: TextStyle(color: Colors.orange),
            ),
            tiles: [
              SettingsTile(
                title: const Text('Language'),
                value: const Text('English'),
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: const Text('Use System Theme'),
                leading: const Icon(Icons.phone_android),
                //    switchValue: isSwitched,
                onToggle: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                initialValue: null,
              ),
            ],
          ),
          SettingsSection(
            //  titlePadding: const EdgeInsets.all(20),
            title: const Text(
              'Section 2',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
            tiles: [
              SettingsTile(
                title: const Text('Security'),
                value: const Text('Fingerprint'),
                leading: const Icon(Icons.lock),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: Text('Use fingerprint'),
                leading: Icon(Icons.fingerprint),
                // switchValue: true,
                onToggle: (value) {},
                initialValue: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
