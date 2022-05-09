import 'package:demo/register.dart';
import 'package:demo/login.dart';
import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bắt đầu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Start'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.orange,
      // appBar: AppBar(
      //   title: Text('Flutter Button'),
      //   elevation: 0,
      // ),
      // body: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [
      //         Colors.white,
      //         Colors.orange,
      //       ],
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //     )
      //   ),

      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.orangeAccent,
            Colors.orange,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                    print("RaiseButton");
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Đăng Nhập",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => register()));
                    print("RaiseButton");
                  },
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Đăng ký ngay",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Đăng nhập nhanh bằng Touch ID',
                    style: TextStyle(
                        fontFamily: 'Montserrat', color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 30),
              Container(
                height: 60,
                // child: RaisedButton(
                child: Image.asset('assets/icons/touchid.png',
                    color: Colors.white),
                // onPressed: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => FingerprintPage()));
                //   print("RaiseButton");
                // },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Touch ID',
                    style: TextStyle(
                        fontFamily: 'Montserrat', color: Colors.white),
                  ) //SizedBox(height: 30,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
