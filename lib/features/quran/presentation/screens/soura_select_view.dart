import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/quran_screen_widgets/build_sliver_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/quran_screen_widgets/soura_select_sliver_context.dart';
import 'package:flutter/material.dart';

class SuoraSelectView extends StatelessWidget {
  const SuoraSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBarWidget(isSearch: true),
                SurahSelectSliver(surahs: []),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
