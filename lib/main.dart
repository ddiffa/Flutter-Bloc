import 'package:flutter/material.dart';
import 'package:product_app/view/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products Showroom',
      home: HomeView(),
    );
  }
}
