import 'package:flutter/material.dart';

import 'agency_list_tile.dart';
import 'building_list_tile.dart';

enum AgencyOrBuilding { agency, building }

class MainSheet extends StatefulWidget {
  const MainSheet({super.key});

  @override
  State<MainSheet> createState() => _MainSheetState();
}

class _MainSheetState extends State<MainSheet> {
  AgencyOrBuilding buttonState = AgencyOrBuilding.agency;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
<<<<<<< HEAD
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 1,
      snapSizes: const [0.4, 1],
=======
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 1,
      snapSizes: const [0.2, 1],
>>>>>>> parent of ce65c65 (4th Upload)
      snap: true,
      builder: (BuildContext context, ScrollController scrollcontroller) {
        return Container(
          decoration: const BoxDecoration(
<<<<<<< HEAD
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  blurRadius: 50,
                  color: Colors.grey,
                )
              ]),
=======
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
>>>>>>> parent of ce65c65 (4th Upload)
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            controller: scrollcontroller,
            itemCount: 2 + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
<<<<<<< HEAD
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
=======
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
>>>>>>> parent of ce65c65 (4th Upload)
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
