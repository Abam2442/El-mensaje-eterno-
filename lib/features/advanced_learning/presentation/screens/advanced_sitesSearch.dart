// ignore_for_file: camel_case_types, sized_box_for_whitespace, prefer_const_constructors

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_appBar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/item _card.dart';

class Advanced_Sites_Search extends StatefulWidget {
  const Advanced_Sites_Search({super.key});

  @override
  State<Advanced_Sites_Search> createState() => _Advanced_Sites_SearchState();
}

class _Advanced_Sites_SearchState extends State<Advanced_Sites_Search> {
  final searchControlle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          const Custom_AppBar(
            title: 'Advanced Sites',
            isSearch: true,
            isPinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                C_TextField(
                  hint_text: 'Search ......',
                  searchControlle: searchControlle,
                ),

                //

                // Container(
                //   padding: EdgeInsets.only(top: 10),
                //   height: 80,
                //   child: Item_GridView(),
                // ),

                //
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    height: Get.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: MediaQuery.of(context).size.height),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const Item_Card(
                          titleSite: '',
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
