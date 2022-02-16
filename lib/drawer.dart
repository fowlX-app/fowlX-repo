import 'package:flutter/material.dart';
import 'package:fowl_x/profIle.dart';
import 'package:fowl_x/home_page.dart';
import 'package:fowl_x/scrreens/notifications.dart';
import 'package:fowl_x/settings.dart';

class drawer extends StatelessWidget {
  Widget build(BuildContext context) {
    //final authService = Provider.of<AuthService>(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.orange,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/pic.png'),
                      radius: 40.0,
                    ),
                  ),
                  const Text(
                    'fowlX',
                    style: TextStyle(fontSize: 22),
                  ),
                  const Text(
                    'poultry management assistant',
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.orange,
                  ),
                  title: TextButton(
                    onPressed: () {
                      // final FirebaseAuth _auth = FirebaseAuth.instance;
                      // final User? user = _auth.currentUser;
                      // final String uid = user!.uid;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: const Text('Home',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: const Icon(
                    Icons.person_outline,
                    color: Colors.orange,
                  ),
                  title: TextButton(
                    onPressed: () {
                      // final FirebaseAuth _auth = FirebaseAuth.instance;
                      // final User? user = _auth.currentUser;
                      // final String uid = user!.uid;
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: const Text('Profile',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.orange),
                  title: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settings()));
                    },
                    child: const Text('Settings',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading:
                      const Icon(Icons.logout_outlined, color: Colors.orange),
                  title: TextButton(
                    onPressed: () async {
                      //  await authService.signOut();
                    },
                    child: const Text('Logout',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
