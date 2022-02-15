import 'package:flutter/material.dart';
import 'package:fowl_x/home_page.dart';
import 'package:fowl_x/vetservices/medic.dart';
import 'package:fowl_x/vetservices/vaccine.dart';

// ignore: use_key_in_widget_constructors
class VetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(primary: Colors.orange),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.orange,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'MEDICATION',
                icon: Icon(
                  Icons.medication_rounded,
                  color: Colors.white,
                ),
              ),
              Tab(
                  text: 'VACCINATION',
                  icon: Icon(
                    Icons.medical_services_rounded,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        // drawer: MainDrawer(),
        body: TabBarView(
          children: [Birds(), MyBirds()],
        ),
      ),
    );
  }
}
