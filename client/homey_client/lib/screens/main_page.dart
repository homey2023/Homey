import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../building_dummy.dart';
import '../models/building.dart';
import 'building_detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 현재위치 변수
  LocationData? currentLocation;

  // 위치 권한 요청하는 함수
  void requestLocationPermission() async {
    var locationRequestStatus = await Permission.location.request();

    if (locationRequestStatus.isGranted) {
      return;
    } else if (locationRequestStatus.isDenied) {
      Get.snackbar("Homey", "필수 권한입니다.");
    } else if (locationRequestStatus.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  // 현재 위치 가져오는 함수
  void getCurrentLocation() {
    Location location = Location();

    location.getLocation().then((location) {
      setState(() {
        currentLocation = location;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
    getCurrentLocation();
  }

  // 매물 데이터
  final List<Building> buildingData = List.generate(
    nameList.length,
    (index) => Building(
      nameList[index],
      imageList[index],
      safeLevelList[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                height: constraints.maxHeight * 0.7,
                child: currentLocation == null // 현재 위치가 없다면 loading. 있으면 지도 띄움
                    ? const Center(
                        child: Text('loading'),
                      )
                    : GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(currentLocation!.latitude!,
                                currentLocation!.longitude!),
                            zoom: 17.5),
                      ),
              );
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 1,
            snapSizes: const [0.3, 1],
            snap: true,
            builder: (BuildContext context, ScrollController scrollcontroller) {
              return Container(
                color: Colors.white,
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
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
