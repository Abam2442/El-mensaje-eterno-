import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/salah_importance_page.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionItemHomePageWidget extends StatelessWidget {
  SectionItemHomePageWidget({
    super.key,
    required this.sectionName,
    required this.sectionSubtitle,
    required this.sectionIcon,
    required this.onTap,
    this.isInfo
  });
  final String sectionName;
  final String sectionSubtitle;
  final String sectionIcon;
  final GestureTapCallback? onTap;
  bool? isInfo = false;
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
                      : const SizedBox.shrink(),

                ],
              ),
            ),
            if(isInfo!=null)
              IconButton(
                onPressed: () {
                  if(isInfo==true){
                    Get.to(() => const SalahImportancePage());
                  }else{
                    String text =
                        'La importancia de la Purificación en el Islam, y es una condición que se debe cumplir antes de realizar la oración\n\n'

                    'De Ibn Umar que dijo:\n'

                    'Que fue a lo de Ibn ‘Amir (para conocer su estado de salud) ya que estaba enfermo y le dijo (Ibn ‘Amir) “Ibn ‘Umar ¿por qué no ruegas a Allah por mí?”.'
                  'Él contestó: “Escuché al Mensajero de Allah ﷺ decir: “Ninguna oración es aceptada sin la purificación previa,........ Muslim\n\n\n'

                  'De Abu Málik Al Hariz Ibn Asim Al Asharí, Allah esté complacido con él que el Mensajero de Allah ﷺ dijo\n'

                  '“La purificación es la mitad del imán (de la fe)....... Muslim'
                  ;
                    Get.defaultDialog(title: 'La importancia de la Purificación en el Islam',content: SingleChildScrollView(child: Text(text),));
                  }

                },
                icon: const Icon(
                  Icons.info_outline,
                  color: AppColors.kGoldenColor,
                ),
              )
          ]),
        ),
      ),
    );
  }
}
