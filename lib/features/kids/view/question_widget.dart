import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/kids/controller/kids_controller.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.kidsController,
    required this.courseIndex,
    required this.lessonIndex,
  });

  final KidsController kidsController;
  final int courseIndex;
  final int lessonIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppColors.kPrimaryColor,
      // margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          leading: CircleAvatar(
            backgroundColor: AppColors.kGoldenColor,
            child: Text(
              '${lessonIndex + 1}',
              style: const TextStyle(
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          trailing: const Icon(
            Icons.arrow_drop_down_circle,
            color: AppColors.kGoldenColor,
            size: 32,
          ),
          title: Text(
            '${kidsController.kidsModel.titles![courseIndex].content![lessonIndex].question}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8),
                child: Text(
                  '${kidsController.kidsModel.titles![courseIndex].content![lessonIndex].answer}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
