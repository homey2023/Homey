import 'package:flutter/material.dart';

import '../building_dummy.dart';
import '../models/building.dart';
import '../screens/building_detail_page.dart';

class MainListTile extends StatelessWidget {
  MainListTile({super.key, required this.index});

  int index;

  // 매물 데이터
  final List<Building> buildingData = List.generate(
    nameList.length,
    (index) => Building(
      name: nameList[index],
      imageList: imageList[index],
      safeLevel: safeLevelList[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.all(20),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BuildingDetailPage(
                building: buildingData[index],
              ),
            ),
          );
        },
        leading: Image.network(
          imageList[index][0],
          cacheWidth: 100,
          cacheHeight: 100,
        ),
        title: Text(
          nameList[index],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        trailing: Text('안전 등급 :  ${safeLevelList[index]}'),
      ),
    );
  }
}
