import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/color/app_color.dart';
import '../../../domain/entities/product_entity.dart';
import 'section_description.dart';
import 'section_list_images.dart';
import 'section_price_button.dart';
import 'section_title_with_quantity.dart';

class BodyContainerDiscripeProduct extends StatelessWidget {
  const BodyContainerDiscripeProduct({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: AppColor.darkGrey,
              offset: Offset(0, 10.h),
              blurRadius: 12,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.h),
            topRight: Radius.circular(20.h),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 4.h),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              SectionTitleWithQuantity(productEntity: productEntity),
              SizedBox(
                height: 20.h,
              ),
              SectionDescription(productEntity: productEntity),
              SizedBox(
                height: 30.h,
              ),
              SectionListImages(productEntity: productEntity),
              SizedBox(
                height: 20.h,
              ),
              const Spacer(),
              SectionPriceAndButtonCart(productEntity: productEntity),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ));
  }
}
