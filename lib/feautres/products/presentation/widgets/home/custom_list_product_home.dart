import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/color/app_color.dart';
import '../../../../../core/fonts/app_font.dart';
import '../../../../../core/function/toast_flutter.dart';
import '../../../../../core/shimmer_loading/shimmer_loading_products.dart';
import '../../../../../core/utils/error_display.dart';
import '../../../../../core/utils/go_router.dart';
import '../../bloc/get_all_products/get_all_products_bloc.dart';
import 'custom_card_product.dart';

class CustomListProductHome extends StatelessWidget {
  const CustomListProductHome({
    super.key,
    this.titleList,
    required this.categoryName,
    this.colorStatus,
    this.isStatus = false,
    this.titleStatus,
    this.isDiscount = false,
  });
  final String? titleList;
  final String categoryName;
  final Color? colorStatus;
  final bool isStatus;
  final String? titleStatus;
  final bool isDiscount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.h,
        top: 20.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleList ?? "",
                style: AppFonts.semiBold_18.copyWith(color: AppColor.jGDark),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          BlocConsumer<AllProductsBloc, AllProductsState>(
            listener: (context, state) {
              if (state is AllProductsStateFailure && !isErrorDisplayed) {
                toast(message: state.errMessage, color: AppColor.erorr);
                isErrorDisplayed = true;
              }
            },
            builder: (context, state) {
              if (state is AllProductsStateSuccess) {
                return SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    itemBuilder: (context, i) {
                      final product = state.products[i];

                      if (product.categoryProduct == categoryName) {
                        return InkWell(
                          onTap: () {
                            context.push(AppRouter.detailsProductView,
                                extra: state.products[i]);
                          },
                          child: CustomCardProduct(
                              id: product.idProduct,
                              priceDiscount: product.discountPercentageProduct,
                              isDiscount: isDiscount,
                              titleStatus: titleStatus ??
                                  "${product.discountPercentageProduct} %",
                              colorStatus: colorStatus,
                              isStatus: isStatus,
                              image: product.image,
                              title: product.titleProduct,
                              price: product.priceProduct,
                              brandProduct: product.brandProduct),
                        );
                      }
                      return Container();
                    },
                  ),
                );
              } else {
                return const ShimmerLoadingProducts();
              }
            },
          )
        ],
      ),
    );
  }
}
