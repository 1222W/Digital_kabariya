import 'package:digital_kabaria_app/Utils/app_text.dart';
import 'package:flutter/material.dart';

class MenuModel {
  final IconData icon;
  final String text;
  MenuModel({this.icon = Icons.abc,this.text = ""});
}

class SideMenuData {
  List<MenuModel> menu  = [
  MenuModel(icon: Icons.home,text: "Home"),
  MenuModel(icon: Icons.person,text: "Users"),
  // MenuModel(icon: Icons.settings,text: "Settings"),
  // MenuModel(icon: Icons.home,text: "Home"),
  // MenuModel(icon: Icons.logout,text: "Sign out"),
];
  
}

