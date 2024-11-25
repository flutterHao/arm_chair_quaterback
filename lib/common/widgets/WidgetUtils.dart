import 'package:flutter/material.dart';

///
///@auther gejiahui
///created at 2024/11/25/10:42

class WidgetUtils {
  static Widget getDialogTransWidget(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: const SizedBox(
          width: double.infinity,
        ),
      ),
    );
  }
}
