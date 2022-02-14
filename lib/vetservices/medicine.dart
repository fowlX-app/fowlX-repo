import 'package:flutter/material.dart';
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
          backgroundColor: Colors.orange,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'MEDICATION',
                icon: Icon(
                  Icons.post_add_outlined,
                  color: Colors.white,
                ),
              ),
              Tab(
                  text: 'VACCINATION',
                  icon: Icon(
                    Icons.post_add_outlined,
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
