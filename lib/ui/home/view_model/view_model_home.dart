import 'package:extramobs_utilitarios/domain/enum.dart';
import 'package:extramobs_utilitarios/domain/models/tab_model.dart';
import 'package:flutter/foundation.dart';

class ViewModelHome extends ChangeNotifier {
  final List<TabToolModel> _tabs = [TabToolModel(type: ETool.backup)];

  int get tabCount => _tabs.length;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  TabToolModel? get activeTab => _tabs.isNotEmpty ? _tabs[_currentIndex] : null;

  void setCurrentTab(TabToolModel tab) {
    setCurrentTabIndex(_tabs.indexOf(tab));
  }

  void setCurrentTabIndex(int index) {
    if (index < 0 || index >= _tabs.length) return;
    _currentIndex = index;
    notifyListeners();
  }

  void addTab(TabToolModel tab) {
    _tabs.add(tab);
    _currentIndex = _tabs.length - 1;
    notifyListeners();
  }

  ETool getTabType(int index) {
    return _tabs[index].type;
  }
}
