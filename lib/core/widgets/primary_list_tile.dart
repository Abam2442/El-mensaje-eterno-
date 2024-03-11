import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PrimaryListTile extends StatelessWidget {
  final int itemNumber;
  final String itemName;
  final bool isSaved;
  final VoidCallback onTap;

  const PrimaryListTile({
    super.key,
    required this.itemNumber,
    required this.itemName,
    required this.isSaved,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: AppColors.kGreenColor,
        ),
        child: Row(
          children: [
            Text(
              '$itemNumber',
              style: const TextStyle(
                color: AppColors.kWhiteColor,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                itemName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: AppColors.kGoldenColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
