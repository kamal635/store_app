import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/function/check_local_arabic.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/classes/image_assets.dart';
import '../../../../../core/fonts/app_font.dart';

class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.brandProduct,
      this.colorStatus,
      this.titleStatus,
      this.isStatus = false,
      this.isDiscount = false,
      this.priceDiscount,
      required this.id});
  final String image;
  final String title;
  final num price;
  final Color? colorStatus;
  final String brandProduct;
  final String? titleStatus;
  final bool isStatus;
  final bool isDiscount;
  final num? priceDiscount;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: isArabicLocale() ? Alignment.topRight : Alignment.topLeft,
      children: [
        Container(
          padding: EdgeInsets.all(5.h),
          width: 155.h,
          margin: EdgeInsets.only(
            right: isArabicLocale() ? 0 : 20.h,
            left: isArabicLocale() ? 20.h : 0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.h),
                child: Hero(
                  tag: id,
                  child: CachedNetworkImage(
                    height: 100.h,
                    imageUrl: image,
                    fadeOutCurve: Curves.bounceInOut,
                    errorWidget: (context, url, error) =>
                        Image.asset(AppAssets.error),
                  ),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                title,
                style: AppFonts.semiBold_14,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                brandProduct,
                style: AppFonts.regular_11.copyWith(color: AppColor.jGMedium),
              ),
              isDiscount
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$${price.toStringAsFixed(1)}",
                          style: AppFonts.semiBold_14.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                          width: 4.h,
                        ),
                        Text(
                          "\$${(price - price * priceDiscount! / 100).toStringAsFixed(1)}",
                          style: AppFonts.semiBold_14.copyWith(
                            color: AppColor.jGDark,
                          ),
                        ),
                      ],
                    )
                  : Text("\$${price.toStringAsFixed(1)}",
                      style: AppFonts.semiBold_14),
            ],
          ),
        ),
        isStatus == true
            ? Material(
                elevation: 3.h,
                shadowColor: AppColor.darkGrey,
                borderRadius: BorderRadius.circular(30.r),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: colorStatus ?? Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    "$titleStatus",
                    style: AppFonts.bold_13.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
