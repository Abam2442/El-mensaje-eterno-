import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/screens/search/hadith_search_screen.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadith_webside_select_sliver_context.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HadithController.instance;
    final Rx<bool> _isSearching = Rx<bool>(false);
    final TextEditingController _searchController =
        Get.find<HadithController>().searchController.value;

    return Obx(
      () => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey),
                  child: IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      _isSearching.value = !_isSearching.value;
                      if (_isSearching.value) {
                        controller.search(_searchController.text);
                      } else {
                        controller.search('');
                        controller.searchResultArabic.clear();
                        controller.searchResultEs.clear();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                _isSearching.value
                    ? SizedBox(
                        width: 200,
                        child: TextField(
                          style: Styles.textStyle18White,
                          onChanged: (value) {
                            controller.search(value);
                          },
                          controller: _searchController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueGrey,
                            hintText: 'Search...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                            hintStyle: Styles.textStyle18White,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: TabBar(
              tabs: controller.tabs,
              controller: controller.tabController,
              labelColor: AppColors.black,
              unselectedLabelColor: const Color(0xFFffE4AC),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.kGreenColor,
            ),
          ),
          controller.searchResultArabic.isNotEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                  childCount: controller.searchResultArabic.length,
                  (context, index) => HadithSearchScreen(
                    arabicSearch: controller.searchResultArabic[index],
                    esSearch: controller.searchResultEs[index],
                  ),
                ))
              : const HadithWebsideSelectSliver()
        ],
      ),
    );
  }
}
