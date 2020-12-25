import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BMSApp());
}

class BMSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMS Electric",
      home: Scaffold(
        body: Center(child: Text("Hello")),
      ),
    );
  }
}