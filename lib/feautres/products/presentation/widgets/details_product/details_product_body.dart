import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/get_all_products/get_all_products_bloc.dart';

import '../../../domain/entities/product_entity.dart';
import 'body_container_discripe_product.dart';
import 'section_image.dart';

class DetailsProductViewBody extends StatelessWidget {
  const DetailsProductViewBody({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<AllProductsBloc>(context)
            .add(const GetAllProductsEvent());
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                SectionImage(
                  productEntity: productEntity,
                ),
                Expanded(
                    child: BodyContainerDiscripeProduct(
                  productEntity: productEntity,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
