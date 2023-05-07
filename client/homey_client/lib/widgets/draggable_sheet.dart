import 'package:flutter/material.dart';

import 'agency_list_tile.dart';
import 'building_list_tile.dart';

enum AgencyOrBuilding { agency, building }

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({super.key});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  AgencyOrBuilding buttonState = AgencyOrBuilding.agency;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 1,
      snapSizes: const [0.4, 1],
      snap: true,
      builder: (BuildContext context, ScrollController scrollcontroller) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  blurRadius: 50,
                  color: Colors.grey,
                )
              ]),
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            controller: scrollcontroller,
            itemCount: 2 + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  children: [
                    Container(
                      width: 100,
                      height: 7.5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              buttonState = AgencyOrBuilding.agency;
                            });
                          },
                          child: const Text('부동산'),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              buttonState = AgencyOrBuilding.building;
                            });
                          },
                          child: const Text('매물'),
                        )
                      ],
                    ),
                  ],
                );
              }
              return buttonState == AgencyOrBuilding.agency
                  ? AgencyListTile(index: index - 1)
                  : BuildingListTile(index: index - 1);
            },
          ),
        );
      },
    );
  }
}
