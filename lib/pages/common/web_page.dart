import 'dart:collection';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WebPage extends StatefulWidget {
  final String title;
  final String url;
  const WebPage(this.title, this.url, {super.key});
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  InAppWebViewController? webViewController;

  double progress = 0;

  void webviewCanBack() async {
    if ((await webViewController!.canGoBack())) {
      webViewController?.goBack();
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result) async {
        if (didPop) {
          return;
        }
        webviewCanBack();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 17.sp,
              color: AppColors.primaryText,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(widget.url)),
                onWebViewCreated: (controller) async {
                  webViewController = controller;
                },
                initialUserScripts: UnmodifiableListView<UserScript>([]),
                onProgressChanged: (controller, progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
              progress < 1.0
                  ? LinearProgressIndicator(
                      value: progress, color: AppColors.accentColor)
                  : Container(),
            ],
          ),
        )),
      ),
    );
  }
}
