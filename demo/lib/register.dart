import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "register",
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              //   title: Text("Second Screen"),
              //   automaticallyImplyLeading: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                // icon: ImageIcon(
                // AssetImage('lib/icons/back.png', color: Colors.black)),
                onPressed: () => Navigator.pop(context, false),
              )),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 105.0, 0.0, 0.0),
                      child: Text('Register',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(310.0, 105.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange)),
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
                            labelText: 'User Name',
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
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange))),
                        obscureText: true,
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
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange))),
                        obscureText: true,
                      ),
                      // SizedBox(height: 5.0),
                      // Container(
                      //   alignment: Alignment(1.0, 0.0),
                      //   padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      //   child: InkWell(
                      //     child: Text(
                      //       'Forgot Password',
                      //       style: TextStyle(
                      //           color: Colors.orange,
                      //           fontWeight: FontWeight.bold,
                      //           fontFamily: 'Montserrat',
                      //           decoration: TextDecoration.underline),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 30),
                      Container(
                        width: 550,
                        height: 50,
                        child: RaisedButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                          onPressed: () {
                            print("RaiseButton");
                          },
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "SIGN UP",
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
