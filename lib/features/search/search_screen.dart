import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/screens/search/hadith_search_screen.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/home_card.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/screens/quran_screen.dart';
import 'package:hiwayda_oracion_islamica/features/search/controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SearchScreenController>(
          init: SearchScreenController(),
          builder: (controller) {
            return SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Form(
                      child: TextFormField(
                        controller: controller.search,
                        onChanged: (String query) {
                          controller.searchFun(query);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey[400],
                          hintText: 'Search...',
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ToggleButtons(
                      isSelected: controller.isCheck,
                      selectedColor: Colors.red,
                      onPressed: controller.onTap,
                      borderRadius: BorderRadius.circular(10),
                      selectedBorderColor: Colors.black,
                      fillColor: Colors.orangeAccent,
                      renderBorder: false,
                      children: List.generate(
                        controller.selection.length,
                        (int index) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              controller.selection[index].image,
                              width: 23,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.itemCount,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            controller.selectedSection == 0 &&
                                    controller.quranController.searchResults
                                        .isNotEmpty
                                ? SearchResultWidget(
                                    searchResult: controller
                                        .quranController.searchResults[index],
                                  )
                                : controller.selectedSection == 1
                                    ? HomeCard(
                                        homeCardData: controller
                                            .homeController.searchResult[index])
                                    : controller.selectedSection == 2
                                        ? HadithSearchScreen(
                                            arabicSearch: controller
                                                .hadithController
                                                .searchResultArabic[index],
                                            esSearch: controller
                                                .hadithController
                                                .searchResultEs[index],
                                          )
                                        : const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
