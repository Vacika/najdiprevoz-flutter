import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_najdiprevoz/services/auth.service.dart';

import 'home.screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final storage = FlutterSecureStorage();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Login with existing \n or create a new account', style: TextStyle(fontSize: 26,
                color: Color.fromRGBO(225, 0, 117, 1),
                fontWeight: FontWeight.bold),),
            Divider(
              color: Color.fromRGBO(225, 0, 117, 1),
              height: 10,
              thickness: 1,
            ),
            Divider(
              color: Colors.white,
              height: 100,
              thickness: 0,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            FlatButton(
                onPressed: () async {
                  var username = _usernameController.text;
                  var password = _passwordController.text;
                  try {
                    String token =
                        await AuthService().login(username, password);
                    if (token != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen.fromBase64(token)));
                    }
                  } catch (exc) {
                    log("ERROR $exc");
                    displayDialog(context, "An Error Occurred",
                        "No account was found matching that username and password");
                  }
                },
                child: Text(
                  "Log In",
                  style: TextStyle(color: Color.fromRGBO(225, 0, 117, 1)),
                )),
            FlatButton(
                onPressed: () async {
                  var username = _usernameController.text;
                  var password = _passwordController.text;

                  if (username.length < 4)
                    displayDialog(context, "Invalid Username",
                        "The username should be at least 4 characters long");
                  else if (password.length < 4)
                    displayDialog(context, "Invalid Password",
                        "The password should be at least 4 characters long");
                  else {
                    // var res = await attemptSignUp(username, password);
                    // if (res == 201)
                    //   displayDialog(context, "Success",
                    //       "The user was created. Log in now.");
                    // else if (res == 409)
                    //   displayDialog(
                    //       context, "That username is already registered",
                    //       "Please try to sign up using another username or log in if you already have an account.");
                    // else {
                    //   displayDialog(
                    //       context, "Error", "An unknown error occurred.");
                    // }
                  }
                },
                child: Text("Sign Up", style: TextStyle(color: Color.fromRGBO(225, 0, 117, 1))))
          ],
        ),
      ),
    ));
  }
}
