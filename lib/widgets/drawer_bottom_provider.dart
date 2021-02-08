import 'package:flutter/cupertino.dart';

class DrawerBottomNavigation extends ChangeNotifier {
  int _currentindex = 0;

  selectedindex(int index) {
    _currentindex = index;
    notifyListeners();
  }

  int get currentindex => _currentindex;
}
