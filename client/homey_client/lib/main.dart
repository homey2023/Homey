import 'package:flutter/material.dart';
import 'package:homey_client/screens/main_page.dart'; // 매물 소개 페이지

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Homey',
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
