
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/screens/surah_screen.dart';

import '../../../../core/utils/components/appbar/build_sliver_appbar.dart';
import '../../domain/entities/surah_entity.dart';
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

  const SearchResultWidget({super.key, required this.searchResult});

  @override
  Widget build(BuildContext context) {
    int findSoraIndex(List<Surah> soras, String soraValue) {
      for (int i = 0; i < soras.length; i++) {
        if (soras[i].name == soraValue) {
          return i;
        }
      }
      return -1; // Return -1 if the sora is not found
    }

    int getAyahIndex(Surah surah, String searchText) {
      return surah.ayat.indexWhere((ayah) => ayah.arabic
          .contains(searchResult['ayat'].arabic));
    }

    return InkWell(
      onTap: () {
        var surahIndex= findSoraIndex(
              Get.find<QuranController>().surahs,
              searchResult['sora'],
            );
         Get.find<QuranController>().currentSurrah = surahIndex+1;
        Get.find<QuranController>().currentAyat = Get.find<QuranController>()
            .surahs[surahIndex]
            .ayat;

        var ayahIndex = getAyahIndex(
            Get.find<QuranController>().surahs[findSoraIndex(
              Get.find<QuranController>().surahs,
              searchResult['sora'],
            )],
            searchResult['ayat'].arabic);
        print('target ${ayahIndex.toString()}');
        print(
            'search ${Get.find<QuranController>().searchController.value.text}');
            
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
