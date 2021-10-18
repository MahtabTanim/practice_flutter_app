import 'package:flutter/material.dart';

class AsyncPage extends StatefulWidget {
  static String id = "/AsyncPage";
  const AsyncPage({Key? key}) : super(key: key);

  @override
  _AsyncPageState createState() => _AsyncPageState();
}

class _AsyncPageState extends State<AsyncPage> {
  Future<void> handleClick() async {
    print("This is simple print 1");
    try {
      await Future.delayed(Duration(seconds: 5), () {
        print("Hello after 5 seconds");
      });
      Future.delayed(Duration(seconds: 10), () {
        print("Hello after 10 seconds");
      });
    } catch (e) {
      print("an error occured");
    }
    print("This is simple print 2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Async Application"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Click Me"),
          onPressed: () async {
            await handleClick();
            print("\n\nHello from build\n\n");
          },
        ),
      ),
    );
  }
}
