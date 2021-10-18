import 'package:flutter/material.dart';

class StackLayout extends StatefulWidget {
  static String Id = "/StackLayout";
  const StackLayout({Key? key}) : super(key: key);

  @override
  _StackLayoutState createState() => _StackLayoutState();
}

class _StackLayoutState extends State<StackLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFFfbe5ae),
        child: Stack(
          children: [
            Positioned(
              top: 130,
              left: 10,
              width: 280,
              height: 280,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.purple,
                    border: Border.all(width: 4 , color: Colors.white)
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 40,
              width: 280,
              height: 280,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red,
                  border: Border.all(width: 3 , color: Colors.white)
                ),
              ),
            ),
            Positioned(
              top: 175,
              left: 65,
              width: 280,
              height: 280,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueAccent,
                    border: Border.all(width: 4 , color: Colors.white)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(width: 1 , color : Colors.white),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    SizedBox(height: 3,),
                    Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(width: 1 , color : Colors.white),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    SizedBox(height: 3,),
                    Container(
                      width: 120,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(width: 1 , color : Colors.white),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ));
  }
}
