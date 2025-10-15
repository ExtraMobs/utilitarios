import 'package:flutter/material.dart';

class MainHomeViewModel extends ChangeNotifier {
  final List<Widget> _tabs = [];
  List<Widget> get tabs => _tabs;

  void addTab(Widget tab) {
    _tabs.add(tab);
    notifyListeners();
  }

  void removeTab(Widget tab) {
    _tabs.remove(tab);
    notifyListeners();
  }

  void removeTabAtIndex(int index) {
    _tabs.removeAt(index);
    notifyListeners();
  }
}
