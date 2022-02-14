//import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fowl_x/home_page.dart';
import 'package:fowl_x/scrreens/signup.dart';
import 'package:fowl_x/services/auth_services.dart';

//import 'package:flutter/cupertino.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const String _title = 'fowl-X';
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.orange,
          //  secondary: Colors.brown,
        ),
      ),
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'fowlX',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

final _auth = FirebaseAuth.instance;

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String email;
  late String password;

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(35),
                child:
                    Icon(Icons.login_rounded, size: 35, color: Colors.orange),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    // fontFamily: 'Dongle-Regular',
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(40),
            child: TextField(
              onChanged: (value) {
                email = value;
              },
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              //forgot password screen
            },
            child: const Text(
              'Forgot Password',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  if (nameController.text == '' ||
                      passwordController.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('All feields are required'),
                      backgroundColor: Colors.orange,
                    ));
                  } else {
                    User? result = await AuthService()
                        .login(nameController.text, passwordController.text);
                    if (result != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    }
                  }
                  /*try {
                    final userAccount = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    if (userAccount != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }*/
                },
              )),
          Row(
            children: <Widget>[
              const Text("Does not have account?"),
              TextButton(
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Signup()),
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}

/*Future signIn async{
  await FirebaseAuth instance.signInWithEmailAndPassword(
  email: nameController.text.trim(),
  password: passwordController.text.trim(),
  );
}*/