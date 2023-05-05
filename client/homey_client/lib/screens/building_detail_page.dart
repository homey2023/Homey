import 'package:flutter/material.dart';

import '../models/building.dart';

class BuildingDetailPage extends StatelessWidget {
  const BuildingDetailPage({
    super.key,
    required this.building,
  });

  final Building building;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(building.name!),
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
              //   child: Image.asset(building.imageList![0]),
              // ),
              Text(
                building.name!,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                building.safeLevel.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
