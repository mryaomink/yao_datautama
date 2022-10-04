import 'package:flutter/material.dart';

class ScreenIndexProvider extends ChangeNotifier {
  int screenIndex = 0;
  int get currentIndex {
    return screenIndex;
  }

  void updateScreenIndex(int newIndex) {
    screenIndex = newIndex;
    notifyListeners();
  }
}
