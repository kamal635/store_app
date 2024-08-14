import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/classes/icons.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/fonts/app_font.dart';
import '../../../../../core/function/toast_flutter.dart';
import '../../../../../core/shimmer_loading/shimmer_loading_products_of_category.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../bloc/get_all_products/get_all_products_bloc.dart';
import '../home/custom_card_product.dart';
import '../../../../../generated/l10n.dart';

class SearchHomeViewBody extends StatelessWidget {
  const SearchHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomTextFormField(
              hintColor: AppColor.darkGrey,
              colorIcon: AppColor.darkGrey,
              hint: S.of(context).Search,
              prefixIcon: AppIcon.search,
              onChanged: (value) {
                BlocProvider.of<AllProductsBloc>(context)
                    .add(SearchAllProductsEvent(query: value));
              },
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: BlocConsumer<AllProductsBloc, AllProductsState>(
              listener: (context, state) {
                if (state is AllProductsStateFailure) {
                  toast(message: state.errMessage, color: AppColor.erorr);
                }
              },
              builder: (context, state) {
                if (state is AllProductsStateLoading) {
                  return const ShimmerLoadingProductsOfCategory();
                }
                if (state is AllProductsStateSearch) {
                  if (state.products.isEmpty) {
                    return Center(
                        child: Text(
                      S.of(context).notResult,
                      style: AppFonts.bold_16,
                    ));
                  }
                  return SizedBox(
                    height: 400,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 40.h,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.54.h,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, i) {
                        final product = state.products[i];
                        return InkWell(
                          onTap: () {
                            context.push(AppRouter.detailsProductView,
                                extra: product);
                          },
                          child: CustomCardProduct(
                            brandProduct: product.brandProduct,
                            id: product.idProduct,
                            image: product.image,
                            price: product.priceProduct,
                            title: product.titleProduct,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
