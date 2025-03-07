// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:arm_chair_quaterback/common/entities/app_image_version_entity.dart';
import 'package:arm_chair_quaterback/common/utils/remove_cache_image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:arm_chair_quaterback/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test("parse url", () {
    var parse = Uri.parse("/home?page=2&scroll=1");
    parse.scheme;
    expect(parse.path, "/home");
  });

  test("delete Cache Image", () {
    List data = [
      {"path": "/image/player/1203.png", "imageVersion": 2},
      {"path": "/image/player/3005.png", "imageVersion": 2},
      {"path": "/image/player/1147.png", "imageVersion": 2},
      {"path": "/image/player/2603.png", "imageVersion": 2},
      {"path": "/image/player/3011.png", "imageVersion": 2},
      {"path": "/image/player/1233.png", "imageVersion": 2},
    ];
    var list = data.map((e) => AppImageVersionEntity.fromJson(e)).toList();
    RemoveCacheImageManager.delete(list);
  });
}
