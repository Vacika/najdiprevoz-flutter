import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_najdiprevoz/services/auth.service.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 0.5,
                indent: 10,
                endIndent: 10,
              ),
              HelpButton(),
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 0.5,
                indent: 10,
                endIndent: 10,
              ),
              LogoutButton(),
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 0.5,
                indent: 10,
                endIndent: 10,
              ),
            ],
          )),
        ));
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text("Logout",
            style: TextStyle(color: Color.fromRGBO(225, 0, 117, 1))),
        onPressed: () async => AuthService().logout(context));
  }
}

class HelpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text("Help",
            style: TextStyle(color: Color.fromRGBO(225, 0, 117, 1))),
        onPressed: () {});
  }
}
