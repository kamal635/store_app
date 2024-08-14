import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feautres/cart/presentation/bloc/cart/cart_bloc.dart';
import '../color/app_color.dart';
import '../fonts/app_font.dart';
import 'custom_icon_left_right.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.onPressedLeading,
    this.onPressedAction,
    this.iconAction,
    this.isAction = false,
    this.isLeading = false,
    this.titleAppbar,
    this.colorCircleAvatar,
    this.isCircleOnLeading = false,
    this.isGradient = true,
    this.colorAppBar,
  });
  final void Function()? onPressedLeading;
  final void Function()? onPressedAction;
  final bool isAction;
  final bool isLeading;
  final bool isCircleOnLeading;
  final bool isGradient;
  final IconData? iconAction;
  final String? titleAppbar;
  final Color? colorCircleAvatar;
  final Color? colorAppBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      titleTextStyle: AppFonts.bold_23.copyWith(color: AppColor.white),
      title: Text(
        titleAppbar ?? "",
      ),
      leadingWidth: 40.h,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            color: colorAppBar,
            gradient: isGradient ? AppColor.linearGradient() : null),
      ),
      leading: isLeading
          ? InkWell(
              onTap: onPressedLeading,
              child: CustomIconLeftOrRight(
                isCircleOnLeading: isCircleOnLeading,
                isAppbar: true,
                colorCircleAvatar: colorCircleAvatar,
              ),
            )
          : const SizedBox(),
      actions: [
        isAction
            ? BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is CartSuccess) {
                    return Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Badge(
                        largeSize: 18.h,
                        label: Text(
                          "${state.cartEntity.listProductEntity.length}",
                          style: AppFonts.semiBold_11,
                        ),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: onPressedAction,
                            icon: Icon(
                              iconAction,
                              size: 16.h,
                              color: AppColor.white,
                            )),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
