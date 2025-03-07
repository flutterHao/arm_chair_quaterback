import 'package:flutter/material.dart';

class TabItemInfo {
  TabItemInfo(
      this.label, this.tabIconNormal, this.tabIconSelected, this.tabPage);

  String label;
  String tabIconNormal;
  String tabIconSelected;
  Widget tabPage;
}
