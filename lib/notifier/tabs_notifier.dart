import 'package:flutter/material.dart';

class SelectedTabNotifier extends ValueNotifier<int> {
  SelectedTabNotifier(int value) : super(value);

  void setSelectedTabIndex(int index) {
    value = index;
  }
}
