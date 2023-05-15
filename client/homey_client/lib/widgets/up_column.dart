import 'package:flutter/material.dart';

class UpColumn extends StatefulWidget {
  const UpColumn({
    super.key,
    required this.agency,
  });

  final Map<String, dynamic> agency;

  @override
  State<UpColumn> createState() => _UpColumnState();
}

class _UpColumnState extends State<UpColumn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.agency['name'],
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: Colors.yellow[700],
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                widget.agency['rating'].toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.article_outlined,
                color: Colors.indigo,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                '인증된 부동산입니다',
                style: TextStyle(color: Colors.indigo, fontSize: 12),
              ),
              const SizedBox(
                width: 60,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text(
                  '문서 확인',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 200,
                child: Text(
                  "오산동 967-3 우성르보아 (주소 넣을 예정)",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  '지도로 검색',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '문의 답변 평균 20-30분',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              TextButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  '문의 하기',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(2.5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  '20년 경력',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.all(2.5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  '상가 전문',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.all(2.5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  '태그 변수 추가',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
