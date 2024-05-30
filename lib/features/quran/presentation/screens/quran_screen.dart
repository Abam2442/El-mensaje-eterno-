import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

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

  SearchResultWidget({required this.searchResult});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            SizedBox(height: 10),
            Text(
              searchResult['ayat'].julioCortes,
              style: TextStyle(
                fontSize: 16,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 5),
            Text(
              searchResult['ayat'].raulGonzalezBornez,
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 5),
            Text(
              searchResult['ayat'].muhammadIsaGarcia,
              style: TextStyle(
                fontSize: 16,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
