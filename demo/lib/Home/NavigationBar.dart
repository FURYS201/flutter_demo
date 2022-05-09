import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:demo/Home/Screens/pages/home_page.dart';
import 'package:demo/Home/Screens/pages/cart_page.dart';
import 'package:demo/Home/Screens/pages/favorite_page.dart';
import 'package:demo/Home/Screens/pages/detail_favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'Color/defaultElements.dart';
import 'Screens/pages/account_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  GlobalKey _NavKey = GlobalKey();

  var PagesAll = [
    HomePage(),
    FavoritePage(),
    CartPage(
      products: fetchProducts(),
    ),
    AccountPage()
  ];

  var myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        key: _NavKey,
        items: [
          SvgPicture.asset(
            "assets/icons/home.svg",
            height: 30,
            color: DefaultElements.knavbariconcolor,
          ),
          SvgPicture.asset(
            "assets/icons/heart.svg",
            height: 30,
            color: DefaultElements.knavbariconcolor,
          ),
          SvgPicture.asset(
            "assets/icons/cart.svg",
            height: 30,
            color: DefaultElements.knavbariconcolor,
          ),
          // SvgPicture.asset(
          //   "assets/icons/list.svg",
          //   height: 30,
          //   color: DefaultElements.knavbariconcolor,
          // ),
          SvgPicture.asset(
            "assets/icons/person.svg",
            height: 30,
            color: DefaultElements.knavbariconcolor,
          ),
        ],
        buttonBackgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        animationCurve: Curves.fastLinearToSlowEaseIn,
        color: DefaultElements.kprimarycolor,
      ),
      body: PagesAll[myindex],
    );
  }
}
