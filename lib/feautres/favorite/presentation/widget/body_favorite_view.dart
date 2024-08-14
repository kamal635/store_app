import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/function/dialog_cart_and_favorite.dart';
import '../../data/local_data_source/icon_favorite_save_local.dart';
import '../blocs/favorite/favorite_bloc.dart';
import 'section_form_field.dart';
import 'section_list_product.dart';
import '../../../../generated/l10n.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
        top: 20.h,
      ),
      child: Column(
        children: [
          SectionFormFieldAndDeleteAllFavoriteAndCart(
            onChanged: (value) {
              BlocProvider.of<FavoriteBloc>(context)
                  .add(SearchFavoriteEvent(query: value));
            },
            onPressedIconDelete: () async {
              await customDialog(
                context: context,
                onPressedCancel: () {
                  context.pop();
                },
                onPressedAgree: () async {
                  BlocProvider.of<FavoriteBloc>(context)
                      .add(RemoveAllFavoriteEvent());
                  await FavoriteIconSaveLocal.clearAllColorIcon();
                  if (!context.mounted) return;
                  context.pop();
                },
                title: S.of(context).dialogFavorite,
              );
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          const SectionListProductFavorite(),
        ],
      ),
    );
  }
}
