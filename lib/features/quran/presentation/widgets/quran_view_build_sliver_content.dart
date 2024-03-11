import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/basmala_image.dart';
import 'package:flutter/material.dart';

class QuranViewSliver extends StatelessWidget {
  const QuranViewSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Column(
          children: [
            BasmalaImage(),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
