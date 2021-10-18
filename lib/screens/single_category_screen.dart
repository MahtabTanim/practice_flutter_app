import 'package:flutter/material.dart';
import 'package:practice1/screens/single_product.dart';
import 'package:practice1/services/api_service.dart';

class SingleCategoryScreen extends StatelessWidget {
  String title;

  SingleCategoryScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title.toString()),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: ApiService.getSingleCategoryProducts(Category: this.title),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List l = snapshot.data as List;
              return ListView.builder(
                itemCount: l.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SingleProduct(l[index]['id'], l[index]['title']);
                      }));
                    },
                    title: Text(l[index]['title'].toString().toUpperCase()),
                    leading: Image.network(
                      l[index]['image'],
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                    trailing: Text(
                      l[index]['price'].toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
