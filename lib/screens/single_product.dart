import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practice1/screens/contact.dart';
import 'package:practice1/services/api_service.dart';

class SingleProduct extends StatelessWidget {
  int _id;
  String _title;
  SingleProduct(this._id, this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._title),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: ApiService.getSingleProduct(_id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map m = snapshot.data as Map;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Image.network(
                      m['image'],
                      fit: BoxFit.fill,
                    ),
                  ),
                  Center(
                    child: Text(
                      m['price'].toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(m['title'].toString(), style: TitleStyle()),
                  Chip(
                    label: Text(
                      m['category'].toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    backgroundColor: Colors.lightBlue[200],
                  ),
                  SizedBox(height: 15),
                  Text(
                    m['description'].toString(),
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.amber,
        ),
        onPressed: () {
          SnackBar snackBar = SnackBar(
            content: Text(
              "item $_title added to the cart",
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }

  TextStyle TitleStyle() {
    return TextStyle(
        color: Colors.black54,
        fontSize: 21,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(blurRadius: 1, color: Colors.red, offset: Offset(-1, -1))
        ]);
  }
}
