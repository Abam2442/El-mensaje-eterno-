import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/services/easy_loader_service.dart';
import 'app_bar_custom.dart';

class ListViewCustom extends StatelessWidget {
  final String question;
  final String answer;
  const ListViewCustom({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: "", actions: [
        IconButton(
            onPressed: () async {
              var data = ClipboardData(text: answer);
              await Clipboard.setData(data);
              EasyLoaderService.showToast(message: "Copied");
            },
            icon: const Icon(
              Icons.copy,
              color: AppColors.kWhiteColor,
            )),
      ]).customAppBar(context),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Question",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kGoldenColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              question,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 18, height: 1.5, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Answer",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kGoldenColor)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              answer,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 18, height: 1.5, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
