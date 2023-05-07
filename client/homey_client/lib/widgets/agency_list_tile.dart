import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/agency_detail_page.dart';

class AgencyListTile extends StatefulWidget {
  AgencyListTile({super.key, required this.index});

  int index;

  @override
  State<AgencyListTile> createState() => _AgencyListTileState();
}

class _AgencyListTileState extends State<AgencyListTile> {
  // 부동산 변수
  List<dynamic>? agencies;

  // 부동산 데이터 불러오는 함수
  void getAgencyData() async {
    // rootBundle.loadString('assets/agency_dummy.json').then((data) {
    //   setState(() {
    //     agencies = json.decode(data);
    //   });
    //   debugPrint(agencies.toString());
    // });

    String jsonString =
        await rootBundle.loadString('lib/assets/agency_dummy.json');

    List<dynamic> data = json.decode(jsonString);

    setState(() {
      agencies = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getAgencyData();
  }

  @override
  Widget build(BuildContext context) {
    return agencies == null
        ? const Center(child: Text('loading'))
        : Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(20),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AgencyDetail(
                      agency: agencies![widget.index],
                    ),
                  ),
                );
              },
              leading: Image.network(
                agencies![widget.index]['picture'],
                cacheWidth: 100,
                cacheHeight: 100,
              ),
              title: Text(
                agencies![widget.index]['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              trailing:
                  Text('안전 등급 :  ${agencies![widget.index]['safeGrade']}'),
            ),
          );
  }
}
