import 'package:flutter/material.dart';

class PromoController {
  final ScrollController scrollController = ScrollController();
  bool isScrolled = false;
  int selectedTabIndex = 0;
  
  void initialize(Function() onScrollChanged) {
    scrollController.addListener(() => _onScroll(onScrollChanged));
  }
  
  void dispose() {
    scrollController.dispose();
  }
  
  void changeTab(int index, Function() updateUI) {
    selectedTabIndex = index;
    updateUI();
  }
  
  
  void _onScroll(Function() updateUI) {
    if (scrollController.offset > 10 && !isScrolled) {
      isScrolled = true;
      updateUI();
    } else if (scrollController.offset <= 10 && isScrolled) {
      isScrolled = false;
      updateUI();
    }
  }
}