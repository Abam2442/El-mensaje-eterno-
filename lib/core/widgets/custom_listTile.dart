import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../styles/text_styles.dart';
class CustomListTile extends StatelessWidget {
  const CustomListTile({required this.title,this.index,this.onTap,super.key,this.onCopy});
  final String title;
  final int? index;
  final GestureTapCallback? onTap;
  final Function()? onCopy;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.kGreenColor,
        elevation: 2.0,
        child: ListTile(
            leading: CircleAvatar(
            backgroundColor: AppColors.kGoldenColor,
            child: Center(child:(index==null)? const Icon(Icons.star) : Text('${index!+1}'),),),
          onTap: onTap,
          title: Text(title,style: Styles.textStyle18White,),
          
          trailing: FittedBox(
            fit: BoxFit.fill,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if(onCopy != null)
                  IconButton(
                    onPressed: onCopy,
                    icon:  const Icon(Icons.copy_outlined, color: AppColors.kGoldenColor),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: onTap,
                    child: const Icon(Icons.arrow_forward_ios_outlined, color: AppColors.kGoldenColor),
                  ),
                ]),
          ),
        )
    );
  }
}
