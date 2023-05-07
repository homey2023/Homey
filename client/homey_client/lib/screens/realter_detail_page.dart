import 'package:flutter/material.dart';

import '../models/realter.dart';

class RealterDetailPage extends StatelessWidget {
  const RealterDetailPage({
    super.key,
    required this.realter,
  });

  final Realter realter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(realter.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Column(
            children: [
              // SizedBox(
              //   width: 250,
              //   height: 250,
              //   child: Image.asset(realter.imageList![0]),
              // ),
              Text(
                realter.name,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
