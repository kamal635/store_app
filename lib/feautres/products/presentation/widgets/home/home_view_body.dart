import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/feautres/auth/presentation/bloc/image_user_bloc/image_user_put_file/image_user_put_file_bloc.dart';
import '../../bloc/get_all_products/get_all_products_bloc.dart';
import '../../bloc/get_category/get_category_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../core/color/app_color.dart';
import 'carouse_slider.dart';
import 'custom_list_product_home.dart';
import 'list_category_home.dart';

import '../../../../../core/classes/image_assets.dart';
import '../../../../../core/widgets/custom_sliver_appbar.dart';
import '../../../../../core/widgets/custom_internet_status.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<AllProductsBloc>(context)
            .add(const GetAllProductsEvent());
        BlocProvider.of<GetCategoryBloc>(context).add(const GetCategory());
      },
      color: AppColor.jGDark,
      child: WillPopScope(
        onWillPop: () async => false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            BlocBuilder<ImageUserPutFileBloc, ImageUserPutFileState>(
              builder: (context, stateImage) {
                return CustomSliverAppBar(
                  action: Material(
                    elevation: 3.h,
                    shadowColor: AppColor.darkGrey,
                    borderRadius: BorderRadius.circular(22.r),
                    child: CircleAvatar(
                      radius: 22.r,
                      backgroundColor: AppColor.background,
                      backgroundImage: stateImage is ImageUserPutFileSuccess
                          ? NetworkImage(stateImage.donlowadUrl)
                          : const AssetImage(AppAssets.avatarProfile)
                              as ImageProvider,
                    ),
                  ),
                );
              },
            ),
            const CustomInternetStatus(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const CustomCarouseSlider(),
                  const ListCategoryHome(),
                  CustomListProductHome(
                    titleList: S.of(context).saleProduct,
                    categoryName: "laptops",
                    colorStatus: AppColor.jGDark,
                    isStatus: true,
                    isDiscount: true,
                  ),
                  CustomListProductHome(
                    titleList: S.of(context).newArrivals,
                    categoryName: "fragrances",
                    isStatus: true,
                    titleStatus: S.of(context).newArrival,
                  ),
                  CustomListProductHome(
                    titleList: S.of(context).recommended,
                    categoryName: "skincare",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
