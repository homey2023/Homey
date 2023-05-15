import 'package:flutter/material.dart';
import 'package:homey_client/config/palette.dart';

import '../widgets/up_column.dart';

class AgencyDetail extends StatefulWidget {
  const AgencyDetail({
    super.key,
    required this.agency,
  });

  final Map<String, dynamic> agency;

  @override
  State<AgencyDetail> createState() => _AgencyDetailState();
}

class _AgencyDetailState extends State<AgencyDetail>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: selectedIndex,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 190,
            color: Colors.black,
            child: Image.network(
              widget.agency['picture'],
            ),
          ),
          UpColumn(
            agency: widget.agency,
          ),
          Container(
            color: Colors.grey[300],
            height: 10,
          ),
          TabBar(
            labelColor: Palette.mainColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Palette.mainColor,
            tabs: const <Tab>[
              Tab(text: '정보'),
              Tab(text: '거래 후기'),
            ],
            controller: tabController,
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
                tabController?.animateTo(index);
              });
            },
          ),
          IndexedStack(
            index: selectedIndex,
            children: <Widget>[
              Visibility(
                maintainState: true,
                visible: selectedIndex == 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '상가를 전문으로 하는 20년 경력의 공인 중개사 입니다.\n르보아공인중개사사무소에 일하고 있는 직원은 2명입니다.\n(공인중개사 상세 정보 변수 추가예정)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  widget.agency['realters'][0]['picture']),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  widget.agency['realters'][1]['picture']),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.article_outlined,
                            color: Palette.mainColor,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            '인증된 공인중개사입니다',
                            style: TextStyle(
                                color: Palette.mainColor, fontSize: 12),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.zero,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 7),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              backgroundColor: Palette.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            child: const Text(
                              '자격증 확인',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                maintainState: true,
                visible: selectedIndex == 1,
                child: Container(
                  height: 50,
                  color: Colors.green,
                  child: const Center(
                    child: Text('Content 거래후기'),
                  ),
                ),
              ),
            ],
          ),
          // DefaultTabController(
          //   length: 2,
          //   child: Column(
          //     children: [
          //       TabBar(
          //         tabs: [
          //           Tab(
          //             text: '정보',
          //           ),
          //           Tab(
          //             text: '거래 후기',
          //           ),
          //         ],
          //       ),
          //       TabBarView(
          //         children: [
          //
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
