// ignore_for_file: camel_case_types

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'pub_up_custom.dart';

class Item_Card extends StatelessWidget {
  final String titleSite;
  final String subtitle;
  final String copyRights;
  final String link;
  final IconData? icon;
  final bool hasCopyRights;
  const Item_Card(
      {super.key,
      required this.titleSite,
      this.subtitle = '',
      this.copyRights = '',
      this.link = '',
      this.hasCopyRights = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kGreenColor,
      child: ListTile(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: VerticalDivider(
            thickness: 2,
            color: AppColors.white,
          ),
        ),
        title: Text(
          titleSite,
          style: Styles.textStyle18Godlen,
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            !hasCopyRights
                ? Container()
                : IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PubUpCustom(
                              body: copyRights,
                              link: link,
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.info,
                      color: AppColors.white,
                    )),
            Container(
              width: 10,
            ),
            Icon(
              icon ?? Icons.arrow_forward_ios,
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
