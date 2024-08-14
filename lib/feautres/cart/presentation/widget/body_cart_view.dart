import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/function/dialog_cart_and_favorite.dart';
import '../bloc/cart/cart_bloc.dart';
import 'section_list_product.dart';
import 'section_price_and_proceed.dart';
import '../../../favorite/data/local_data_source/icon_button_to_cart.dart';
import '../../../favorite/presentation/widget/section_form_field.dart';
import '../../../../generated/l10n.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20.h,
            right: 20.h,
            top: 10.h,
          ),
          child: Column(
            children: [
              SectionFormFieldAndDeleteAllFavoriteAndCart(
                onChanged: (value) {
                  BlocProvider.of<CartBloc>(context)
                      .add(SearchInCartEvent(query: value));
                },
                onPressedIconDelete: () async {
                  await customDialog(
                    context: context,
                    onPressedCancel: () {
                      context.pop();
                    },
                    onPressedAgree: () async {
                      BlocProvider.of<CartBloc>(context)
                          .add(ClearAllFromCartEvent());
                      await AddToCartButtonSaveLocal.clearAllAdd();
                      if (!context.mounted) return;
                      context.pop();
                    },
                    title: S.of(context).dialogCart,
                  );
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              const SectionListProductCart(),
              const SizedBox(
                height: kToolbarHeight,
              ),
            ],
          ),
        ),
        const SectionPriceAndProceedCart(),
      ],
    );
  }
}
