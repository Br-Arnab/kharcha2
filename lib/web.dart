import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class web extends StatelessWidget {
  const web({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSfjv_7GH5NJICCUvvzjP3Y1VSdTqfcjQwrvhURHETDgNLA9CA/viewform?usp=sf_link',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
