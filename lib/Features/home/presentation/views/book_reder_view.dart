import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../Core/utlis/colors.dart';
import '../../../../Core/utlis/styles.dart';

class BookReaderScreen extends StatelessWidget {
  final String? bookUrl;

  BookReaderScreen({required this.bookUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: AppColors.appBar,
        title: const Text(
          "Let's Read",
          style: AppStyles.title18,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: WebView(
            initialUrl: bookUrl,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
