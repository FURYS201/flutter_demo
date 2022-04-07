import 'dart:io';

import 'package:demo/Home/Component/defaultElements.dart';
import 'package:demo/Home/NavigationBar.dart';
import 'package:demo/Home/NavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:demo/main.dart';

class login extends StatelessWidget {
  var home_main;

  @override
  Widget build(BuildContext context) {
    var CommunityMaterialIcons;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "login",
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              //   title: Text("Second Screen"),
              //   automaticallyImplyLeading: true,
              leading: IconButton(
                //icon: Icon(CommunityMaterialIcons.back, color: Colors.white),
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                // icon: ImageIcon(AssetImage(
                //   'lib/icons/back.png',
                // )),
                onPressed: () => Navigator.pop(context, false),
              )),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text('Hello',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                      child: Text('There',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: DefaultElements.kprimarycolor)),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange))),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange))),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: DefaultElements.kprimarycolor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: 400,
                        height: 50,
                        child: RaisedButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                          onPressed: () {
                            var main2;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Navigation()));

                            print("RaiseButton");
                          },
                          color: DefaultElements.kprimarycolor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
