import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/classes/icons.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/fonts/app_font.dart';
import '../../../domain/entities/product_entity.dart';

class SectionIncrementQuantity extends StatelessWidget {
  const SectionIncrementQuantity({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            ...List.generate(
              5,
              (index) => FaIcon(
                productEntity.ratingProduct >= index + 1
                    ? AppIcon.solidStar
                    : productEntity.ratingProduct <= index
                        ? AppIcon.star
                        : AppIcon.starHalf,
                color: AppColor.star,
                size: 10.h,
              ),
            ),
            SizedBox(
              width: 5.h,
            ),
            Text(
              "(${productEntity.ratingProduct})",
              style: AppFonts.regular_10.copyWith(color: AppColor.jGDark),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "${S.of(context).stock} : ${productEntity.stockProduct}",
          style: AppFonts.bold_13.copyWith(color: AppColor.jGDark),
        ),
      ],
    );
  }
}
