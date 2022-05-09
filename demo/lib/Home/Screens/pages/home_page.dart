import 'dart:ui';

import 'package:demo/Home/Models/cartlogohomeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demo/Home/Color/defaultElements.dart';
import 'package:demo/Home/Models/homeshoelistModel.dart';
import 'package:demo/Home/Models/categoriesModel.dart';
import 'package:demo/Home/Screens/itemsCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultElements.kdefaultbgcolor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildAppBar(),
              buildCategoriesSection(context),
              // buildCategoriesSection(context),

              SizedBox(
                height: 10,
              ),
              //gggg(),
              buildProductSection(),
              //buildCategoriesSection(context),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    itemCount: shoeListModel.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => Itemcards(
                      shoeListModel: shoeListModel[index],
                      index: index,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  cartlogoHome() {
    return Container(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cartlogohomeModel.length,
        itemBuilder: (context, index) => CategoryCard(
          icon: cartlogohomeModel[index].icon,
          press: () {},
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 5),
      ),
    );
  }

  buildAppBar() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "FURY",
                    style: TextStyle(
                      color: DefaultElements.kprimarycolor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                  text: "Shop",
                  style: TextStyle(
                    color: DefaultElements.ksecondrycolor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.only(right: 13),
              child: IconButton(
                icon: SvgPicture.asset("assets/icons/search_icon.svg"),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildProductSection() {
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 10, right: 25),
      child: Row(
        children: [
          Text(
            "Sản phẩm",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            "Sắp xếp",
            style: TextStyle(
              color: DefaultElements.knavbariconcolor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 15,
            color: DefaultElements.knavbariconcolor,
          )
        ],
      ),
    );
  }

  buildCategoriesSection(BuildContext context) {
    return Container(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cartlogohomeModel.length,
        itemBuilder: (context, index) => CategoryCard(
          icon: cartlogohomeModel[index].icon,
          press: () {},
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 5),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1, right: 0, bottom: 0, top: 0),
      padding: EdgeInsets.all(2),
      height: 90,
      width: 90,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon),
            // const SizedBox(height: 5),
            // Text(
            //   title,
            //   style: Theme.of(context).textTheme.subtitle2,
            // )
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Nike',
    'Adidas',
    'Puma',
    'Li-ning',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {}
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {}
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
