import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../function/check_local_arabic.dart';
import '../function/toast_flutter.dart';
import '../../feautres/favorite/data/local_data_source/icon_favorite_save_local.dart';
import '../../feautres/favorite/presentation/blocs/favorite/favorite_bloc.dart';
import '../../feautres/products/domain/entities/product_entity.dart';
import '../../../../../core/classes/icons.dart';
import '../../../../../core/color/app_color.dart';

class CustomIconFavorite extends StatelessWidget {
  const CustomIconFavorite({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: isArabicLocale() ? 0 : 20.h,
          left: isArabicLocale() ? 20.h : 0,
          bottom: 20.h),
      child: Material(
        elevation: 3.h,
        shape: const CircleBorder(),
        shadowColor: AppColor.darkGrey,
        child: CircleAvatar(
          backgroundColor: AppColor.background,
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () async {
                    if (FavoriteIconSaveLocal.getColorIcon(productEntity) ==
                        false) {
                      if (!context.mounted) return;
                      BlocProvider.of<FavoriteBloc>(context)
                          .add(AddFavoriteEvent(productEntity: productEntity));
                      await FavoriteIconSaveLocal.addColorToIcon(productEntity);
                      toast(
                          message: "Add Product Success",
                          color: AppColor.jGDark);
                    } else {
                      if (!context.mounted) return;
                      BlocProvider.of<FavoriteBloc>(context).add(
                          RemoveFavoriteEvent(productEntity: productEntity));
                      await FavoriteIconSaveLocal.removeColorToIcon(
                          productEntity);
                    }
                  },
                  icon: FaIcon(
                    FavoriteIconSaveLocal.getColorIcon(productEntity) == false
                        ? AppIcon.favorite
                        : AppIcon.favoriteSolid,
                    color: AppColor.jGDark,
                    size: 18.h,
                  ));
            },
          ),
        ),
      ),
    );
  }
}
