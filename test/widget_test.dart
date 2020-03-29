// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wande/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

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
//    http://47.103.206.101:8210/juvenile-mobile/juvenile/eval/getActivityItemList?
//    grade=4&
//    accessKey=wd-client-mobile&
//    appType=android&
//    clientPackage=com.xueduoduo.wande.evaluation.test&
//    rdmTime=2020-03-29%2016:27:23&
//    clientVersion=1.0.0&
//    systemVersion=27&
//    deviceId=111cf30d-4453-4944-8ba6-2e9eaeebfc0d&
//    operatorId=914&
//    schoolCode=PDWDXX&
//    token=745ff0fb5029785d

//    http://47.103.206.101:8210/juvenile-mobile/juvenile/eval/getActivityItemList?
//    grade=5&
//    appType=android&
//    systemVersion=23&
//    clientVersion=1.0.0&
//    clientPackage=com.xueduoduo.wande.evaluation&
//    deviceId=51ee0b20-7187-11ea-82c1-d56249e19519&
//    accessKey=wd-client-mobile&
//    rdmTime=2020-03-29+16%3A27%3A58&
//    operateId=914&
//    schoolCode=PDWDXX&
//    token=99cceb3d966fc383
}
