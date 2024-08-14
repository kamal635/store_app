import 'package:flutter/material.dart';

import '../../../domain/entities/product_entity.dart';
import 'section_increment_quantity_with_rate.dart';
import 'section_title_with_brand.dart';

class SectionTitleWithQuantity extends StatelessWidget {
  const SectionTitleWithQuantity({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SectionRateWithTitle(productEntity: productEntity),
        SectionIncrementQuantity(productEntity: productEntity),
      ],
    );
  }
}
