import 'package:flutter/material.dart';

import '../home_page.dart';

// ignore: use_key_in_widget_constructors
class NotificationScreen extends StatelessWidget {
  //const ProfilePage({Key? key}) : super(key: key);

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: listView(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Text('Notification Screen'),
      backgroundColor: Colors.orange,
    );
  }

  Widget listView() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return listViewItem(index);
        },
        separatorBuilder: (context, index) {
          return Divider(height: 0);
        },
        itemCount: 10);
  }

  Widget listViewItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(index),
                  timeAndDate(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget prefixIcon() {
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: Icon(
        Icons.notifications,
        size: 25,
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget message(int index) {
    double textSize = 14;
    return Container(
        child: RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: '',
                style: TextStyle(
                    fontSize: textSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: const [
                  TextSpan(
                      text: 'Notification Description',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ))
                ])));
  }

  Widget timeAndDate(int index) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              '23-01-2021',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              '07:10 am',
              style: TextStyle(
                fontSize: 10,
              ),
            )
          ],
        ));
  }
}
