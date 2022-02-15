import 'package:flutter/material.dart';
import 'package:fowl_x/chick/chick_details.dart';
import 'package:fowl_x/chick/cock_details.dart';
import 'package:fowl_x/chick/layer_details.dart';

import '../home_page.dart';

// ignore: use_key_in_widget_constructors
class StockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(primary: Colors.orange),
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.orange,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'COCKS',
                /*icon: Icon(
                    Icons.post_add_outlined,
                    color: Colors.black,
                  ),*/
              ),
              Tab(
                text: 'CHICKS',
                /*icon: Icon(
                    Icons.post_add_outlined,
                    color: Colors.black,
                  )*/
              ),
              Tab(
                text: 'HENS',
                /*icon: Icon(
                  Icons.a,
                  color: Colors.black,
                ),*/
              ),
            ],
          ),
        ),
        // drawer: MainDrawer(),
        body: TabBarView(
          children: [
            CocksInfo(),
            ChicksInfo(),
            BirdsInfo(),
          ],
        ),
      ),
    );
  }
}
