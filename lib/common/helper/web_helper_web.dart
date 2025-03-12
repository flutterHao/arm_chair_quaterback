///
///@auther gejiahui
///created at 2025/3/12/12:01

import 'dart:html' as html;

void resetUrl() {
  html.window.history.replaceState(null, 'Home', '/');
}