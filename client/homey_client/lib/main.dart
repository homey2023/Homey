import 'package:flutter/material.dart';
import 'package:homey_client/screens/home.dart'; // 매물 소개 페이지

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Homey',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
