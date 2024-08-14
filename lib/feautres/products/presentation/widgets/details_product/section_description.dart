import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/fonts/app_font.dart';

import '../../../domain/entities/product_entity.dart';

class SectionDescription extends StatelessWidget {
  const SectionDescription({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).description,
            style: AppFonts.semiBold_16.copyWith(color: AppColor.jGMedium),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            productEntity.descriptionProduct,
            style: AppFonts.regular_11,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
