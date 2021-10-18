import 'package:flutter/material.dart';

import 'after_sign.dart';

// import 'after_sign.dart';

class SignUp extends StatefulWidget {
  static String id = '/sign_up';
  const SignUp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController con = TextEditingController();
  TextEditingController con2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onSaved: (value){
                print("$value is saved");
              },
              validator: (value) {
                if (value!.isEmpty) return "Value cant be null";
                return null;
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.pending_outlined),

                label: const Text("username"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabled: true,
                hintText: "username",
              ),
              controller: con,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(

              obscureText: true,
              keyboardType: TextInputType.name,
              onSaved: (value){
                print("$value is saved");
              },
              validator: (value) {
                if (value!.isEmpty ||
                    !(value.contains('@')) ||
                    !(value.contains('.')) || value[value.length-1]=='.' )  {
                  return "enter valid email";
                }
                return null;
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),

                label: const Text("email"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),

                ),
                enabled: true,
                alignLabelWithHint: true,
                hintText: "your email please",
              ),
              controller: con2,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  print("Name is ${con.text} \nEmail is ${con2.text}");
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print("form submitted successfully");
                    Navigator.pushNamed(context, AfterSign.id);
                  }
                  // Navigator.pushNamed(context, AfterSign.id);
                },
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 30,
                ))
          ],
        ),
      ),
    ));
  }
}
