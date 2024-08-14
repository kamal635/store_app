import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/classes/image_assets.dart';
import '../../../../core/fonts/app_font.dart';
import '../../../../generated/l10n.dart';

class SectionEmptyFavoriteOrCart extends StatelessWidget {
  const SectionEmptyFavoriteOrCart({super.key, this.isCart = false});
  final bool isCart;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          isCart ? AppAssets.cartEmpty : AppAssets.favoriteEmpty,
          height: 80.h,
        ),
        Text(
          isCart ? S.of(context).cartEmpty : S.of(context).favoritesEmpty,
          style: AppFonts.regular_10,
        ),
      ],
    );
  }
}
