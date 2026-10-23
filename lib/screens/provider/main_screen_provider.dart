import 'package:flutter/material.dart';
import 'package:news_app/common/enums/category_enum.dart';

class MainScreenProvider extends ChangeNotifier {
  //value
  CategoryEnum? categoryEnum;

  //function
  void changeCategory(CategoryEnum? newCategory) {
    categoryEnum = newCategory;
    notifyListeners();

    //scope main screen
  }
}
