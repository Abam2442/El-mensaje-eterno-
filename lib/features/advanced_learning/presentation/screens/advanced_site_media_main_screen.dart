import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/controller/advanced_learning_controller.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/widgets/custom_appBar.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/widgets/item%20_card.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class AdvancedSiteMediaMainScreen extends StatelessWidget {
  const AdvancedSiteMediaMainScreen(this.page, {super.key});
  final Map page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: page['title'],
            isSearch: false,
            isPinned: true,
          ),
          GetBuilder<AdvancedLearningController>(
            builder: (controller) => SliverToBoxAdapter(
              child: Column(
                children: [
                  //
                  Directionality(
                      textDirection: TextDirection.ltr,
                      child: Container(
                        height: Get.height,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                              bottom: Get.height / 4.5),
                          itemCount: page['targetScreen'].length,
                          itemBuilder: (context, index) {
                            final selectedPage = page['targetScreen'][index];
                            return InkWell(
                              onTap: () async {
                                if ((selectedPage).containsKey('fun') &&
                                    selectedPage['fun'] == true) {
                                  try {
                                    var data = await rootBundle
                                        .load("assets/books/book1.pdf");
                                    Directory tempDir =
                                        await getTemporaryDirectory();
                                    String tempPath = tempDir.path;
                                    var filePath =
                                        '$tempPath/Quiero abrazar el islam pero.pdf'; // file_01.tmp is dump file, can be anything
                                    File file = await File(filePath)
                                        .writeAsBytes(data.buffer.asUint8List(
                                            data.offsetInBytes,
                                            data.lengthInBytes));
                                    OpenFile.open(file.path);
                                  } catch (e) {
                                    print('there is error');
                                    print(e);
                                  }
                                } else if ((selectedPage).containsKey('fun') &&
                                    selectedPage['fun'] == false) {
                                  var data = await rootBundle
                                      .load("assets/books/dawah.docx");
                                  Directory tempDir =
                                      await getTemporaryDirectory();
                                  String tempPath = tempDir.path;
                                  var filePath = '$tempPath/dawah.docx';
                                  File file = await File(filePath).writeAsBytes(
                                      data.buffer.asUint8List(
                                          data.offsetInBytes,
                                          data.lengthInBytes));
                                  OpenFile.open(file.path);
                                } else {
                                  Get.toNamed(
                                    selectedPage['targetScreen'],
                                  );
                                }
                              },
                              child: ItemCard(
                                hasCopyRights:
                                    selectedPage.containsKey('copyRight'),
                                titleSite: selectedPage['title'],
                                subtitle: selectedPage['description'],
                                copyRights: selectedPage['copyRight'] ?? '',
                                link: selectedPage['link'] ?? '',
                                icon: selectedPage.containsKey('icon')
                                    ? selectedPage['icon']
                                    : null,
                              ),
                            );
                          },
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
