import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/pub_up_custom.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';

class HomeCard extends StatelessWidget {
  final HomeCardData homeCardData;

  const HomeCard({super.key, required this.homeCardData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(homeCardData.targetScreen,
          arguments: {'title': homeCardData.title}),
      child: Container(
        height: Get.height * 0.1,
        decoration: const BoxDecoration(
          color: AppColors.kGreenColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      homeCardData.iconPath,
                      width: 23,
                    ),
                    const VerticalDivider(
                      color: AppColors.kWhiteColor,
                      indent: 5,
                      width: 15,
                      endIndent: 5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            homeCardData.title,
                            style: const TextStyle(
                              color: AppColors.kGoldenColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            homeCardData.description,
                            style: const TextStyle(
                              color: AppColors.kWhiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              homeCardData.copyRight == null || homeCardData.copyRight!.isEmpty
                  ? Container()
                  : IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PubUpCustom(
                                body: homeCardData.copyRight.toString(),
                                link: homeCardData.link.toString(),
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.info,
                        color: AppColors.white,
                      )),
              homeCardData.giude == null || homeCardData.giude!.isEmpty
                  ? Container()
                  : IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PubUpCustom(
                                body: homeCardData.giude.toString(),
                                link: '',
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.info,
                        color: AppColors.kGoldenColor,
                      )),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.kWhiteColor,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
