import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:get/get.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
// import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
// import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/direction_aware.dart';
// import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/islam_web_entities.dart';
import 'package:number_paginator/number_paginator.dart';

import '../controller/islam_web_controller.dart';
import '../widget/app_bar_custom.dart';
import '../widget/inkwell_custom.dart';
import '../widget/listviewcustom.dart';

class IslamWebMainScreen extends GetView<IslamWebControllerImp> {
  const IslamWebMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(IslamWebControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Web", actions: [
        // IconButton(
        //     onPressed: () async {
        //       IslamWebEntities? result = await showSearch(
        //           context: context,
        //           delegate: _IslamWebSearchDelegate(data: controller.data));
        //       if (result != null) {
        //         Get.to(ListViewCustom(
        //             question: result.question, answer: result.answer));
        //       }
        //     },
        //     icon: const Icon(Icons.search))
      ]).customAppBar(context),
      body: GetBuilder<IslamWebControllerImp>(
          builder: (controller) => controller.getArticalsState !=
                  StateType.success
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      NumberPaginator(
                        initialPage: controller.pageIndex,
                        numberPages: controller.data.length ~/ 20,
                        onPageChange: controller.onPageChanged,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ListView.builder(
                              padding: const EdgeInsets.all(5),
                              itemCount: controller.currentPageData.length,
                              itemBuilder: (context, index) {
                                return InkwellCustom(
                                  catigory: false,
                                  dataText:
                                      controller.currentPageData[index].title,
                                  onTap: () {
                                    Get.to(ListViewCustom(
                                        question: controller
                                            .currentPageData[index].question,
                                        answer: controller
                                            .currentPageData[index].answer));
                                  },
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
/*
class _IslamWebSearchDelegate extends SearchDelegate<IslamWebEntities> {
  _IslamWebSearchDelegate({required this.data})
      : super(
          searchFieldLabel: "hintText",
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );
  final List<IslamWebEntities> data;
  @override
  Widget buildLeading(BuildContext context) => DirectionAware(
        child: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<IslamWebEntities> suggestionList = query.isEmpty
        ? []
        : data
            .where((item) =>
                item.question.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return SizedBox();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].question),
          onTap: () {
            query = suggestionList[index].question;
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<IslamWebEntities> searchResults = data
        .where(
            (item) => item.question.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].question),
          onTap: () {
            // Handle the selected search result.
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) => <Widget>[];

  @override
  ThemeData appBarTheme(context) => Theme.of(context).copyWith(
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            backgroundColor: AppColors.kPrimaryColor,
          ),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white, selectionColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey.shade600),
          border: InputBorder.none));
}
*/