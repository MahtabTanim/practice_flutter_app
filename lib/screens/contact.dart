import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  static String id = '/contact';
  const Contact({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Contact();
}

class _Contact extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Hello world in contact "),
      ),
    );
  }
}
