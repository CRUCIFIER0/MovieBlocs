import 'package:flutter/material.dart';
import 'package:yellowclassapp/services/authService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoggingIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: SafeArea(
          child: Center(
            child: (isLoggingIn)
                ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                            color: Colors.white, fontSize: 64),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoggingIn = true;
                          });
                          await AuthService().login();
                          setState(() {
                            isLoggingIn = false;
                          });
                        },
                        child: Text(
                          'SignIn Using Google',
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.only(
                              left: 18, right: 18, top: 8, bottom: 9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
