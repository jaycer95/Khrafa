import 'package:Khrafa/drawer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'homescreen.dart';
import 'contact.dart';
import 'sliders.dart';
import 'drawer.dart';
import 'config.dart';
import 'rateus.dart';
import 'audio/try.dart';
import 'package:tuple/tuple.dart' show Tuple2;
import 'dart:ui';


//class of home page 
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String title = 'خرافة';
  final List<Tuple2> _pages = [
    Tuple2('Home', HomeScreen()),
    Tuple2('Library', Library()),
    Tuple2('Audio', AudioP()),
  ];

  int _selectedPage = 0;

  PageController _pageController = PageController();
//widget build the content of the home page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
          title: Text(
            "خرافة",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.right,
            style: new TextStyle(
              fontFamily: ArabicFonts.Amiri,
              package: 'google_fonts_arabic',
              fontSize: 30.0,
              color: Colors.black54,
            ),
          ),
          iconTheme: new IconThemeData(color: Colors.black54),
          centerTitle: true,
          gradient:
              LinearGradient(colors: [Colors.blue[100], Colors.green[100]])),
      body: PageView(
        children: _pages.map<Widget>((Tuple2 page) => page.item2).toList(),
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        controller: _pageController,
      ),
      drawer: DrawerClass(),
    );
  }
}
