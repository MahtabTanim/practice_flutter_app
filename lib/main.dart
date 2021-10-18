import 'package:flutter/material.dart';
import 'screens/async_application.dart';
import 'screens/future_application.dart';
import 'screens/stack_layout.dart';
import 'screens/stream_screen.dart';
import 'screens/home.dart';
import 'screens/contact.dart';
import 'screens/after_sign.dart';
import 'screens/sign_up.dart';
import 'screens/api_service_screen.dart';
import 'services/api_service.dart';

void main() {
  runApp(MaterialApp(
    title: "practice app",
    theme: ThemeData(primarySwatch: Colors.purple),
    initialRoute: ApiServiceScreen.id,
    routes: {
      Contact.id: (context) => Contact(),
      Home.id: (context) => Home(),
      SignUp.id: (context) => SignUp(),
      AfterSign.id: (context) => AfterSign(),
      StackLayout.Id: (context) => StackLayout(),
      FutureScreen.id: (context) => FutureScreen(),
      AsyncPage.id: (Context) => AsyncPage(),
      StreamScreen.id: (context) => StreamScreen(),
      ApiServiceScreen.id: (context) => ApiServiceScreen()
    },
  ));
}
