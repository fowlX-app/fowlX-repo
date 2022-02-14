import 'package:flutter/material.dart';
import 'package:fowl_x/chick/cocks.dart';
import 'package:fowl_x/chick/chick.dart';
import 'package:fowl_x/chick/layer.dart';

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
                text: 'LAYERS',
                /*icon: Icon(
                  Icons.a,
                  color: Colors.black,
                ),*/
              ),
            ],
          ),
        ),
        // drawer: MainDrawer(),
        body: const TabBarView(
          children: [
            cockscreen(),
            ChickScreen(),
            LayerScreen(),
          ],
        ),
      ),
    );
  }
}
