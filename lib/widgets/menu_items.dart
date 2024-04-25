import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/model/menu_item.dart';

class MenuItems {
  static const List<MenuItem> items = [
    reportItem,
    shareItem,
  ];
  static const reportItem =
      MenuItem(title: "Report Bug", icon: Icons.bug_report);
  static const shareItem = MenuItem(title: "Share", icon: Icons.share);
}
