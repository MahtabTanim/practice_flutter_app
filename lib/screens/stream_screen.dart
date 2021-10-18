import 'dart:async';

import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  static String id = "/StreamScreen";
  const StreamScreen({Key? key}) : super(key: key);

  @override
  _StreamScreenState createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  int _count = 0;
  String s = "this is default message";
  final StreamController streamController = StreamController();

  void HandleClick() async {
    streamController.stream.listen((event) {
      this.s = event;
      setState(() {});
    });
    for (int i = 0; i <= 4; i++) {
      streamController.add("you got a message $i");
      await Future.delayed(Duration(seconds: 2));
    }
  }

  Stream myStream() async* {
    for (int i = 0; i <= 5; i++) {
      yield i;
      await Future.delayed(Duration(seconds: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream screen"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: myStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data.toString()),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
