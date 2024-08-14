import 'package:flutter/material.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/fonts/app_font.dart';
import '../../../domain/entities/product_entity.dart';

class SectionRateWithTitle extends StatelessWidget {
  const SectionRateWithTitle({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(
            productEntity.titleProduct,
            style: AppFonts.semiBold_18.copyWith(color: AppColor.jGMedium),
          ),
        ),
        Text(
          productEntity.brandProduct,
          style: AppFonts.regular_11,
        ),
      ],
    );
  }
}
