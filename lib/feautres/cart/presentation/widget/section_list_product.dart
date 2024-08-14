import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/classes/icons.dart';
import '../../../../core/color/app_color.dart';
import '../../../../core/function/check_local_arabic.dart';
import '../../../../core/function/toast_flutter.dart';
import '../../../../core/utils/go_router.dart';
import '../bloc/cart/cart_bloc.dart';
import '../../../favorite/data/local_data_source/icon_button_to_cart.dart';
import '../../../favorite/presentation/widget/section_card_product.dart';
import '../../../favorite/presentation/widget/section_empty_favorite.dart';

class SectionListProductCart extends StatelessWidget {
  const SectionListProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          toast(message: state.errorMessage, color: AppColor.erorr);
        }
      },
      builder: (context, state) {
        if (state is CartLoading) {
          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        }
        if (state is CartSuccess) {
          if (state.cartEntity.listProductEntity.isEmpty) {
            return const Expanded(
                child: SectionEmptyFavoriteOrCart(
              isCart: true,
            ));
          } else {
            return Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.cartEntity
                      .updateQuantity(
                          productEntity: state.cartEntity.listProductEntity)
                      .keys
                      .length,
                  itemBuilder: (context, i) {
                    return Dismissible(
                      background: Container(
                        alignment: isArabicLocale()
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        padding: EdgeInsets.only(
                            right: isArabicLocale() ? 0 : 30.h,
                            left: isArabicLocale() ? 30.h : 0),
                        margin: EdgeInsets.only(bottom: 15.h),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(14.h),
                        ),
                        child: Icon(
                          AppIcon.trash,
                          size: 16.h,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                      key: UniqueKey(),
                      onDismissed: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          BlocProvider.of<CartBloc>(context).add(
                              RemoveIndexFromCart(
                                  productEntity:
                                      state.cartEntity.listProductEntity[i]));
                        }
                        await AddToCartButtonSaveLocal.removeButton(
                            state.cartEntity.listProductEntity[i]);
                      },
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          return false;
                        }
                        return true;
                      },
                      child: SizedBox(
                        child: InkWell(
                          onTap: () {
                            context.push(AppRouter.detailsProductView,
                                extra: state.cartEntity.listProductEntity[i]);
                          },
                          child: CustomCardWishlistAndCart(
                            quantity: state.cartEntity
                                .updateQuantity(
                                    productEntity:
                                        state.cartEntity.listProductEntity)
                                .values
                                .elementAt(i),
                            isCart: true,
                            onPressed: () async {
                              BlocProvider.of<CartBloc>(context).add(
                                  RemoveIndexFromCart(
                                      productEntity: state
                                          .cartEntity.listProductEntity[i]));
                              await AddToCartButtonSaveLocal.removeButton(
                                  state.cartEntity.listProductEntity[i]);
                            },
                            productEntity: state.cartEntity
                                .updateQuantity(
                                    productEntity:
                                        state.cartEntity.listProductEntity)
                                .keys
                                .elementAt(i),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
