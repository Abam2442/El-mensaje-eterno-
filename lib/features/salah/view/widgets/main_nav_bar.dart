import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({
    super.key,
    required this.index,
  });

  final int? index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: index!,
      onTap: (value) {
        // currentIndex = value;
        // setState(() {});
      },
      selectedItemColor: AppColors.kPrimaryColor,
      unselectedItemColor: AppColors.kGreenColor,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          /*Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.shopping_cart_outlined),
              Positioned(
                  top: -3,
                  right: -3,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: AppColors.yRedColor,
                    child: MainText(
                      '2',
                      color: AppColors.kWhiteColor,
                      fontSize: 10,
                    ),
                  ))
            ],
          ),*/
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border_outlined),
          label: 'Offer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          //Icon(Icons.person_2_outlined),
          label: 'Account',
        ),
      ],
    );
  }
}
