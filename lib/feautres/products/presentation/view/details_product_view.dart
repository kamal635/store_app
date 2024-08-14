import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/classes/icons.dart';
import '../../../../core/utils/go_router.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../domain/entities/product_entity.dart';
import '../widgets/details_product/details_product_body.dart';

class DetailsProductView extends StatelessWidget {
  const DetailsProductView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        colorCircleAvatar: Colors.transparent,
        isLeading: true,
        isAction: true,
        iconAction: AppIcon.bagShopping,
        onPressedAction: () {
          context.push(AppRouter.cartView);
        },
        onPressedLeading: () {
          context.pop();
        },
      ),
      body: DetailsProductViewBody(productEntity: productEntity),
    );
  }
}
