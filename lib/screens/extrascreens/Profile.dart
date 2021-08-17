import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:yellowclassapp/services/authService.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      body: SafeArea(
        child: Container(
          child: TextButton(
                    onPressed: () {
                      AuthService().logout();
                    },
                    child: Text('Logout')
          )

          ),
      ),
    );
  }
}
