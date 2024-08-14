import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/classes/icons.dart';
import '../../../../../core/fonts/app_font.dart';
import '../../../../../generated/l10n.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.currentIndex, this.onTap});
  final int currentIndex;
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Theme.of(context)
          .bottomNavigationBarTheme
          .selectedLabelStyle!
          .backgroundColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(
            AppIcon.home,
          ),
          label: S.of(context).home,
        ),
        BottomNavigationBarItem(
          icon: const FaIcon(
            AppIcon.cart,
          ),
          label: S.of(context).cart,
        ),
        BottomNavigationBarItem(
          icon: const FaIcon(
            AppIcon.favorite,
          ),
          label: S.of(context).favorite,
        ),
        BottomNavigationBarItem(
          icon: const FaIcon(
            AppIcon.profile,
          ),
          label: S.of(context).profile,
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
      elevation: 2.h,
      iconSize: 16.h,
      unselectedLabelStyle: AppFonts.regular_10,
      selectedLabelStyle: AppFonts.regular_10,
      type: BottomNavigationBarType.fixed,
    );
  }
}
