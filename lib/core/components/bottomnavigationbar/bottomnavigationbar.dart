import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view/_bottom_navbar/viewmodel/bottom_navbar_view_model.dart';
import '../../constants/color/app_colors.dart';

class CustomBottomNavigationBar extends BottomNavigationBar {
  CustomBottomNavigationBar({super.key, required BuildContext context})
      : super(
          showSelectedLabels: false,
          selectedFontSize: 0,
          showUnselectedLabels: false,
          elevation: 0,
          iconSize: 30,
          selectedIconTheme: IconThemeData(color: AppColors.white),
          unselectedIconTheme: IconThemeData(color: AppColors.whiteGrey),
          selectedItemColor: Colors.red,
          currentIndex: context.read<BottomNavbarViewModel>().selectedIndex,
          onTap: context.read<BottomNavbarViewModel>().onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.dark,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: '',
            ),
          ],
        );
}
