import 'dart:ffi';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/ayah_entity.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/surrah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/aya_language_container.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/aya_text.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/quran_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyaContainer extends StatelessWidget {
  final Ayah ayah;
  final int number;

  const AyaContainer({required this.number, required this.ayah, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
       var controller =  Get.find<SurahController>();
       if(controller.isCopyingAyas.value)
       { 
        if(controller.selectedAyas.contains(ayah))
        {
          controller.selectedAyas.remove(ayah);

        }
        else
        {
          controller.selectedAyas.add(ayah);
        }
       }
      },
      child: Container(
       
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 228, 227, 225),
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           
               
            QuranPageWidget(number: number, ayah: ayah),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
              
               AyaArabicText(aya: ayah.arabic, ayaNumber: number),
              const Divider(),
              GetX<QuranController>(
               
                builder: (controller) => Column(
                  children:  controller.selectedTafsirs.map((e) => AyaLanguageContainer(
                      ayaNonArabic: ayah.tafsirs[e] ?? 'sin Tafsir' ,
                      mafsir : e,
                      ayaNumber: number,
                    ),).toList()
                  
                   
                ),
              ),
              const SizedBox(height: 8,)
                      
                ],
              ),
            )
           
          ],
        ),
      ),
    );
  }
}
