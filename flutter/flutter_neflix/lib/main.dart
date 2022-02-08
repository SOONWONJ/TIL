import 'package:flutter/material.dart';
import 'package:flutter_neflix/screen/home_screen.dart';
import 'package:flutter_neflix/widget/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              Container(
                child: Center(
                  child: Text('search'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('save'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('more'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
