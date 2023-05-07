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
      maxChildSize: 1,
      snapSizes: const [0.2, 1],
      snap: true,
      builder: (BuildContext context, ScrollController scrollcontroller) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            controller: scrollcontroller,
            itemCount: nameList.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.only(top: statusBarHeight),
                  child: Column(
                    children: const [
                      SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 5,
                        ),
                      ),
                    ],
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
