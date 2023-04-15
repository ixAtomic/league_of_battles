import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  bool _isVisible = true;

  bool get isVisible => _isVisible;
  int get count => _count;

  void toggleVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void increment() {
    _count++;
    if (_count >= 5) _count = 0;
    notifyListeners();
  }
}
