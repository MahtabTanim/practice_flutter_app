import 'package:flutter/material.dart';

class FutureScreen extends StatefulWidget {
  static String id = "/FutureScreen";
  const FutureScreen({Key? key}) : super(key: key);

  @override
  _FutureScreenState createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Future Screen"),
        ),
        body: FutureBuilder(
          future: getUserName(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("snapshot has data");
              return Center(child: Text(snapshot.data.toString()));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Future<void> getData() async {
    Future.delayed(Duration(seconds: 3), () {
      print("printing hello after 3 seconds");
    }).then((value) {
      Future.delayed(Duration(seconds: 2), () {
        print("printing hello after 5 seconds");
      });
    }).catchError((onError) {
      print("This is an errod");
    });
    print("This is random text");
  }

  Future<String> getUserName() async {
    final String user = await Future.delayed(Duration(seconds: 10), () {
      return "hello tanim";
    });
    return user;
  }
}
