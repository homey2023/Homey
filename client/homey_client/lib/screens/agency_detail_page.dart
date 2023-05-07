import 'package:flutter/material.dart';

class AgencyDetail extends StatelessWidget {
  const AgencyDetail({
    super.key,
    required this.agency,
  });

  final Map<String, dynamic> agency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(agency['name']),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Center(
              child: Image.network(
                agency['picture'],
                cacheWidth: 1000,
                cacheHeight: 1000,
              ),
            ),
            const Text('*이름'),
            Text(agency['name']),
            const Text('*장점'),
            Text(agency['merits'][0]),
            Text(agency['merits'][1]),
            Text(agency['merits'][2]),
            const Text('*별점'),
            Text(agency['rating'].toString()),
            const Text('*리뷰'),
            Text(agency['review'][0]),
            Text(agency['review'][1]),
            Text(agency['review'][2]),
            Divider(
              height: 10,
            ),
            Text(agency['realters'][0]['name']),
            Text(agency['realters'][1]['name']),
          ],
        ),
      ),
    );
  }
}
