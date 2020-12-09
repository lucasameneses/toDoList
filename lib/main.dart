import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'initialPage.dart';
import 'stores/controller.dart';

void main() {
  Get.lazyPut(() => ListController());
  runApp(GetMaterialApp(
    home: InitialPage(),
  ));
}

class ListCategory{
  
}
class Category {
  List<ToDo> categoryList;
  String name;
  Category(this.name);
}

class ToDo {
  String name;
  bool check;
}

