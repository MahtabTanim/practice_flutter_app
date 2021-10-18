import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'contact.dart';

class Home extends StatefulWidget {
  static String id = '/home';

  Home({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _home();
  }
}

class _home extends State<Home> {
  List<Widget> pages = [Home(), Contact(), SignUp()];
  int _ind = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_ind == 0) ? firstCase() : pages[_ind],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: _ind,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Sign Up"),
        ],
        onTap: (index) {
          setState(() {
            _ind = index;
          });
        },
      ),
    );
  }

  Widget firstCase() {
    return Center(
        child: IconButton(
      onPressed: () {
        Navigator.pushNamed(context, Contact.id);
      },
      icon: Icon(
        Icons.airline_seat_recline_normal,
        size: 50,
      ),
    ));
  }
}
