import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{
  
  int  selectedIndex = 0;
  void onItemTapped(int index) {
      
      selectedIndex = index;
      notifyListeners();
    
  }

  
}


