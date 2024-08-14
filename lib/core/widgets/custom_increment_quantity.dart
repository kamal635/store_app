import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../feautres/cart/presentation/bloc/cart/cart_bloc.dart';
import '../../feautres/products/domain/entities/product_entity.dart';
import '../classes/icons.dart';
import '../color/app_color.dart';
import '../fonts/app_font.dart';

class CustomIncrementQuantity extends StatelessWidget {
  const CustomIncrementQuantity(
      {super.key, required this.quantity, required this.productEntity});
  final num quantity;
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.h,
      shadowColor: AppColor.darkGrey,
      borderRadius: BorderRadius.circular(16.h),
      child: Container(
        width: 90.h,
        height: 28.h,
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        decoration: BoxDecoration(
          color: AppColor.jGMediumDark,
          borderRadius: BorderRadius.circular(16.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                BlocProvider.of<CartBloc>(context)
                    .add(RemoveFromCartEvent(productEntity: productEntity));
              },
              icon: FaIcon(
                AppIcon.minus,
                size: 15.h,
                color: AppColor.white,
              ),
            ),
            Text(
              "$quantity",
              style: AppFonts.regular_13.copyWith(color: AppColor.white),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                BlocProvider.of<CartBloc>(context)
                    .add(AddToCartEvent(productEntity: productEntity));
              },
              icon: FaIcon(
                AppIcon.plus,
                size: 15.h,
                color: AppColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
