import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionItemHomePageWidget extends StatelessWidget {
  const SectionItemHomePageWidget({
    super.key,
    required this.sectionName,
    required this.sectionSubtitle,
    required this.sectionIcon,
    required this.onTap
  });
  final String sectionName;
  final String sectionSubtitle;
  final String sectionIcon;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.kGreenColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: IntrinsicHeight(
          child: Row(children: [
            SizedBox(
                width: 34,
                height: 34,
                child: SvgPicture.asset(
                  sectionIcon,
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              width: 10,
            ),
            const VerticalDivider(
              color: AppColors.kWhiteColor,
              thickness: 1.6,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sectionName,
                    style: Styles.textStyle20Golden,
                  ),
                  sectionSubtitle != ''
                      ? Text(
                          sectionSubtitle,
                          style: Styles.textStyle10.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        )
                      : const SizedBox.shrink()
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
