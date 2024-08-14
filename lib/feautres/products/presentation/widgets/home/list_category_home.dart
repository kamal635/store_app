import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/function/check_local_arabic.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/color/app_color.dart';

import '../../../../../core/shimmer_loading/shimmer_loading_category.dart';
import '../../bloc/get_category/get_category_bloc.dart';
import '../category/custom_box_category.dart';

import '../../../../../core/fonts/app_font.dart';
import '../../../../../core/utils/error_display.dart';
import '../../../../../core/classes/icon_category.dart';
import '../../../../../core/function/toast_flutter.dart';

class ListCategoryHome extends StatelessWidget {
  const ListCategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).categories,
                style: AppFonts.semiBold_18.copyWith(color: AppColor.jGDark),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
              height: 90.h,
              child: BlocConsumer<GetCategoryBloc, GetCategoryState>(
                listener: (context, state) {
                  if (state is GetCategoryFailure && !isErrorDisplayed) {
                    toast(message: state.errMessage, color: AppColor.erorr);
                    isErrorDisplayed = true;
                  }
                },
                builder: (context, state) {
                  if (state is GetCategorySuccess) {
                    return ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.category.length,
                        itemBuilder: (context, i) {
                          return Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: isArabicLocale() ? 0 : 30.w,
                                  left: isArabicLocale() ? 30.w : 0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    context.push(AppRouter.productCategory,
                                        extra: state.category[i]);
                                  },
                                  child: CustomBoxCategory(
                                    image: AppCategoryIcon
                                        .categoryListIcon[i].icon,
                                    title: state.category[i].categoryName,
                                    colorbox: AppCategoryIcon
                                        .categoryListIcon[i].colorbox,
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  } else {
                    return const ShimmerLoadingCategory();
                  }
                },
              ))
        ],
      ),
    );
  }
}
