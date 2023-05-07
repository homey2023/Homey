import 'package:flutter/material.dart';

import '../building_dummy.dart';
import 'main_list_tile.dart';

class MainSheet extends StatefulWidget {
  const MainSheet({super.key});

  @override
  State<MainSheet> createState() => _MainSheetState();
}

class _MainSheetState extends State<MainSheet> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      snapSizes: const [0.2, 0.8],
      snap: true,
      builder: (BuildContext context, ScrollController scrollcontroller) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
          ),
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            controller: scrollcontroller,
            itemCount: nameList.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  height: 7.5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.grey,
                  ),
                );
              }
              return MainListTile(index: index);
            },
          ),
        );
      },
    );
  }
}
