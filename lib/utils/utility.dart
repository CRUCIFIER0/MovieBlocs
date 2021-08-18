import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:convert';

class Utility {
  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.cover,
      width: 120,
      height: 160,
    );
  }
  static Image imageFromBase64Stringnew(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.cover,
      width: 180,
      height: 260,
    );
  }

  static showAlertDialog(BuildContext context, String message) {
    Widget okButton = TextButton(
      child: Text("OK", style: TextStyle(color: Colors.deepOrange),),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
