import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/main_map.dart';
import '../widgets/main_sheet.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 현재 위치 변수
  LocationData? currentLocation;

  // 위치 권한 요청하는 함수
  void requestLocationPermission() async {
    var locationRequestStatus = await Permission.location.request();

    if (locationRequestStatus.isGranted) {
      return;
    } else if (locationRequestStatus.isDenied) {
      Fluttertoast.showToast(
          msg: "필수권한입니다",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
      requestLocationPermission();
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

  // 처음 페이지에 들어오면 실행하는 함수
  @override
  void initState() {
    super.initState();
    requestLocationPermission();
    getCurrentLocation();
  }

  // MainMap은 위에 나오는 지도위젯이고,
  // MainSheet는 아래에 나오는 목록위젯입니다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MainMap(currentLocation: currentLocation),
          const MainSheet(),
        ],
      ),
    );
  }
}
