import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/soura_select_sliver_context.dart';

import '../../domain/entities/surah_entity.dart';

class SuoraSelectView extends StatelessWidget {
  const SuoraSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBarWidget(isSearch: true),
                SurahSelectSliver(surahs: RxList<Surah>([])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
