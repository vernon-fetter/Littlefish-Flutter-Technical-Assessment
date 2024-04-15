import 'package:flutter/foundation.dart';

class PageProvider with ChangeNotifier {
  String? _prev = "";
  String? get prev => _prev;
  set prev(String? newValue) {
    _prev = newValue;
    notifyListeners();
  }

  String? _next = "";
  String? get next => _next;
  set next(String? newValue) {
    _next = newValue;
    notifyListeners();
  }

  int? _count;
  int? get count => _count;
  set count(int? newValue) {
    _count = newValue;
    notifyListeners();
  }

  int? _pages;
  int? get pages => _pages;
  set pages(int? newValue) {
    _pages = newValue;
    notifyListeners();
  }

  int? _currentPage = 1;
  int? get currentPage => _currentPage;
  set currentPage(int? newValue) {
    _currentPage = newValue;
    notifyListeners();
  }
}
