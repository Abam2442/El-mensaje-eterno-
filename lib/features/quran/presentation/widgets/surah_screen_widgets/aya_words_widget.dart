import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/surah_controller.dart';

class AyaWordsWidget extends StatefulWidget {
  const AyaWordsWidget({super.key, required this.aya, required this.ayaNumber});

  final String aya;
  final int ayaNumber;

  @override
  State<AyaWordsWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AyaWordsWidget> {
  List<String> words = [];
  int? selectedWordIndex;

  @override
  void initState() {
    words = widget.aya.split(' ');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: List.generate(
            words.length,
            (index) => InkWell(
                  onTap: () async {
                    setState(() {
                      selectedWordIndex = index;
                    });

                    Get.find<SurahController>()
                        .reciteWord(widget.ayaNumber, selectedWordIndex ?? 0);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: selectedWordIndex == index
                            ? const Color.fromARGB(148, 255, 255, 255)
                            : null,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      words[index],
                      style: GoogleFonts.amiriQuran(
                          fontSize: 22, fontWeight: FontWeight.w900),
                    ),
                  ),
                )));
  }
}
