import 'package:flutter/material.dart';
import 'package:practice1/screens/single_product.dart';
import 'package:practice1/services/api_service.dart';
import 'single_category_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Screen"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiService.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List categories = snapshot.data as List;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  margin:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
                  child: ListTile(
                    onTap: () {
                      String category = categories[index].toString();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SingleCategoryScreen(category);
                      }));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    title: Text(
                      categories[index].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    tileColor: Colors.redAccent,
                  ),
                );
              },
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
