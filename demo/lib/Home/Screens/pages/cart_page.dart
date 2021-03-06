import 'dart:convert';
import 'dart:async';
import 'package:demo/Home/Models/cartModel.dart';
import 'package:demo/Home/widget/dismissible_widget.dart';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';
import 'package:demo/Home/Widget/app_bar.dart';
import 'package:demo/Home/Color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

List<Cast> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Cast>((json) => Cast.fromMap(json)).toList();
}

Future<List<Cast>> fetchProducts() async {
  final response = await http.get(
      Uri.parse('https://624aab21fd7e30c51c101b00.mockapi.io/ShoeListModel'));
  if (response.statusCode == 200) {
    return parseProducts(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

class CartPage extends StatelessWidget {
  final Future<List<Cast>> products;
  CartPage({Key? key, required this.products}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          title: 'Product Navigation demo home page', products: products),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final Future<List<Cast>> products;
  MyHomePage({Key? key, required this.title, required this.products})
      : super(key: key);

  // final items = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Cast>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ProductBoxList(items: snapshot.data ?? [])

                // return the ListView widget :
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
      bottomNavigationBar: CartIcon(),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.item}) : super(key: key);
  final Cast item;

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(1, (index) {
          return FadeInDown(
            duration: Duration(milliseconds: 350 * index),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: grey,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0.5,
                              color: black.withOpacity(0.1),
                              blurRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 25, right: 25, bottom: 25),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/" + this.item.image),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.item.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            this.item.price + " \$",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                          Text(
                            "x1",
                            style: TextStyle(
                                fontSize: 14,
                                color: black.withOpacity(0.5),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ProductBoxList extends StatelessWidget {
  final List<Cast> items;
  ProductBoxList({Key? key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return DismissibleWidget(
          child: ProductBox(item: items[index]),
          onDismissed: (direction) => dismissItem(context, index, direction),
          item: null,
        );
      },
    );
  }

  void dismissItem(
    BuildContext context,
    int index,
    DismissDirection direction,
  ) {}
}

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 22,
                        color: black.withOpacity(0.5),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "\$ 508.00",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: black,
                        onPressed: () {},
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "CHECKOUT",
                              style: TextStyle(
                                  color: white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )),
                  )
                ])));
  }
}
