import 'package:flutter/material.dart';

class AfterSign extends StatefulWidget {
  static String id = '/AfterSign';
  const AfterSign({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AfterSign();
  }
}

class _AfterSign extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ElevatedButton(
          child: Text("Show Dialog"),
          onPressed: (){
            ShowDialog();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Hello")));
          },
        ),
      ),
    );
  }
  dynamic ShowDialog(){
    return showDialog(context: context , builder: (context)=>AlertDialog(
      title: Text("Hello"),
      content: const Text("Hello"),
    ));
  }
}
