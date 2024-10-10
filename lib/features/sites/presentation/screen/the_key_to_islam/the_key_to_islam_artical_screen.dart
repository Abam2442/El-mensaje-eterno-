// import 'package:elresala/core/constants/app_colors.dart';
// import 'package:elresala/core/constants/app_themes.dart';
// import 'package:elresala/features/sites/data/models/the_key_to_islam_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/services/easy_loader_service.dart';
import '../../../data/models/the_key_to_islam_model.dart';
import '../../widget/app_bar_custom.dart';

class TheKeyToIslamArticalView extends StatelessWidget {
  final TheKeyToIslamfirst theKeyToIslamfirst;
  const TheKeyToIslamArticalView({super.key, required this.theKeyToIslamfirst});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(title: theKeyToIslamfirst.name, actions: [
          IconButton(
              onPressed: () async {
                var data = ClipboardData(text: theKeyToIslamfirst.description);
                await Clipboard.setData(data);
                EasyLoaderService.showToast(message: "Copied");
              },
              icon: const Icon(
                Icons.copy,
                color: AppColors.kWhiteColor,
              )),
        ]).customAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SelectableText(
                theKeyToIslamfirst.description,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              theKeyToIslamfirst.videos.isEmpty ||
                      theKeyToIslamfirst.videos.first.title == 'title'
                  ? Container()
                  : const Center(
                      child: Text(
                        'videos',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kGreenColor),
                      ),
                    ),
              theKeyToIslamfirst.videos.isEmpty ||
                      theKeyToIslamfirst.videos.first.title == 'title'
                  ? Container()
                  : SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: theKeyToIslamfirst.videos.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: AppColors.kGreenColor,
                            child: ListTile(
                              onTap: () async {
                                var url = Uri.parse(theKeyToIslamfirst
                                    .videos[index].url
                                    .toString());
                                await launchUrl(url);
                              },
                              trailing: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                textDirection: TextDirection.rtl,
                                color: AppColors.amber,
                              ),
                              title: Text(
                                theKeyToIslamfirst.videos[index].title,
                                style: const TextStyle(
                                    color: AppColors.kGoldenColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    )
            ],
          ),
        ));
  }
}
