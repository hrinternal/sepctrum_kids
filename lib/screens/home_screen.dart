import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:spectrum_kids/categories/drag_and_drop.dart';
import 'package:spectrum_kids/categories/fill_alphabets.dart';
import 'package:spectrum_kids/categories/match.dart';
import 'package:spectrum_kids/categories/painting.dart';
import 'package:spectrum_kids/categories/recite.dart';
import 'package:spectrum_kids/categories/recite_along.dart';
import 'package:spectrum_kids/categories/recite_fruits.dart';
import 'package:spectrum_kids/screens/category.dart';

// import 'package:spectrum_kids/categories/recite_along.dart';
import 'package:spectrum_kids/utility/color_box.dart';
import 'package:spectrum_kids/categories/click.dart';
import 'package:spectrum_kids/categories/tracing.dart';

// import 'package:spectrum_kids/widgets/app_drawer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

// import 'package:spectrum_kids/categories/recite_colors.dart';
// import 'package:spectrum_kids/categories/fill_alphabets.dart';
// import 'package:spectrum_kids/categories/drag_and_drop.dart';

import 'package:spectrum_kids/screens/library_screen.dart';
import 'package:spectrum_kids/screens/my_books_screen.dart';
import 'package:spectrum_kids/screens/second_my_books.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  final List? accessCodeBooks;

  HomeScreen({this.accessCodeBooks});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchTextController = TextEditingController();
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    LibraryScreen(),
    MyBooksScreen(),
    CategoryScreen(),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorBox.primaryColor,
        leading: Container(),
        title: Image.asset(
          'assets/images/logo.png',
          width: 20,
          color: Colors.white,
          height: 20,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: ColorBox.primaryColor,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_24_regular),
            label: 'Home',
            // title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.arrow_download_24_regular),
            label: 'My Books',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(FluentIcons.note_24_regular),
          //   label: 'Book Details',
          // ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.games_24_regular),
            label: 'Categories',
          ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.person, color: Colors.white12),
          //     title: Text('Profile', style: TextStyle(color: Colors.white),)
          // )
        ],
      ),
    );
  }
}
