import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/surah_entity.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/screens/surah_screen.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/quran_screen_widgets/soura_select_sliver_context.dart';
import 'package:hiwayda_oracion_islamica/features/quran/quran_bindings.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuranBindings().dependencies();
   final controller  = Get.put(QuranController());
    final Rx<bool> _isSearching = Rx<bool>(false);
    final TextEditingController _searchController =
        Get.find<QuranController>().searchController.value;
    return Obx(
      () => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
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
    );
  }
}

class SearchResultWidget extends StatelessWidget {
  final Map<String, dynamic> searchResult;

  const SearchResultWidget({super.key, required this.searchResult});

  @override
  Widget build(BuildContext context) {
    final QuranController controller = QuranController.instance;
    int findSoraIndex(List<Surah> soras, String soraValue) {
      for (int i = 0; i < soras.length; i++) {
        if (soras[i].name == soraValue) {
          return i;
        }
      }
      return -1;
    }

    int getAyahIndex(Surah surah, String searchText) {
      return surah.ayat.indexWhere(
          (ayah) => ayah.arabic.contains(searchResult['ayat'].arabic));
    }

    return InkWell(
      onTap: () {
        var surahIndex = findSoraIndex(
          controller.surahs,
          searchResult['sora'],
        );
        controller.currentSurrah = surahIndex + 1;
        controller.currentAyat = controller.surahs[surahIndex].ayat;

        var ayahIndex = getAyahIndex(
            controller.surahs[findSoraIndex(
              controller.surahs,
              searchResult['sora'],
            )],
            searchResult['ayat'].arabic);

        Get.to(() => SurahScreen(
              ayaNumber: ayahIndex + 1,
            ));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${searchResult['sora']}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                searchResult['ayat'].arabic,
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
