import 'package:flutter/material.dart';
import 'package:practice1/screens/all_category_screen.dart';
import 'package:practice1/services/api_service.dart';
import 'cart_screen.dart';
import 'single_product.dart';

class ApiServiceScreen extends StatefulWidget {
  static String id = "/ApiServiceScreen";
  const ApiServiceScreen({Key? key}) : super(key: key);

  @override
  _ApiServiceScreenState createState() => _ApiServiceScreenState();
}

class _ApiServiceScreenState extends State<ApiServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CategoryScreen();
              }));
            },
            child: Text(
              "Categories",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      appBar: AppBar(
          title: Text("Api service screen"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartScreen(id: 6)));
                },
                icon: Icon(Icons.add_shopping_cart_sharp)),
          ]),
      body: FutureBuilder(
        future: ApiService.getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List l = snapshot.data as List;
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
                    title: Text(l[index]['title']),
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
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
