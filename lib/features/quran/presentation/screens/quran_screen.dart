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
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
          ),
          onChanged: (value) {
            // Handle search here
            // You can use the controller to filter the surahs based on the search query
            controller.search(value);
          },
        ),
      ),
      body: Obx(
        () => CustomScrollView(
          slivers: [
            const SliverAppBarWidget(title: "Quran"),
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
    return ListTile(
      title: Text(searchResult['sora']),
      subtitle: Text(searchResult['ayat'].arabic),
    );
  }
}
