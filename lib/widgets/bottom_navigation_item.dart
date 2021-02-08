import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spectrum_kids/screens/home_screen.dart';
import 'package:spectrum_kids/screens/my_books_screen.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: HomeScreen(),
      icon: Icon(Icons.home),
      title: Text("Home"),
    ),
    TabNavigationItem(
      page: MyBooksScreen(),
      icon: Icon(Icons.shopping_basket),
      title: Text("Shop"),
    ),
    // TabNavigationItem(
    //   page: SearchPage(),
    //   icon: Icon(Icons.search),
    //   title: Text("Search"),
    // ),
  ];
}