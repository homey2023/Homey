import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../widgets/agency_list_tile.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.zero,
          padding:
              const EdgeInsets.only(top: 60, bottom: 30, left: 40, right: 40),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Form(
            child: TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(
                  Icons.search,
                  color: Palette.mainColor,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(35.0),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(35.0),
                  ),
                ),
                hintText: '나만의 공인중개사를 검색하세요',
                hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey[300],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return AgencyListTile(index: index);
            },
          ),
        ),
      ],
    );
  }
}
