import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_pages_routes.dart';
import '../../../../core/utils/components/appbar/build_sliver_appbar.dart';
import '../controller/quran_controller.dart';
import '../widgets/soura_select_sliver_context.dart';

class QuranScreen extends GetView<QuranController> {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          slivers: [
            const SliverAppBarWidget(
              title: "Quran",
              isSearch: true,
            ),
            controller.isSearching.value
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => SearchResultWidget(
                        index: index,
                        searchResult: controller.searchResults[index],
                      ),
                      childCount: controller.searchResults.length,
                    ),
                  )
                : SurahSelectSliver(surahs: controller.surahs),
          ],
        ),
      ),
    );
  }
}

class SearchResultWidget extends StatelessWidget {
  final Map<String, dynamic> searchResult;
  final int index;

  SearchResultWidget({required this.searchResult, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<QuranController>().currentAyat =
            Get.find<QuranController>().surahs[index].ayat;
        Get.toNamed(AppPagesRoutes.surahScreen);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                searchResult['sora'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                searchResult['ayat'].arabic,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              // SizedBox(height: 10),
              // Text(
              //   searchResult['ayat'].julioCortes,
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.deepPurple,
              //   ),
              // ),
              // SizedBox(height: 5),
              // Text(
              //   searchResult['ayat'].raulGonzalezBornez,
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.green,
              //   ),
              // ),
              // SizedBox(height: 5),
              // Text(
              //   searchResult['ayat'].muhammadIsaGarcia,
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.teal,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
