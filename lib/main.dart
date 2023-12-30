
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'firstscreen.dart';
void main() {
  runApp(const Firstin());
}
class Firstin extends StatelessWidget {
  const Firstin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(

    home: Firstscreen(),
  );
}








