import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/function/check_local_arabic.dart';
import '../../../../../core/widgets/custom_favorite_icon.dart';
import '../../../domain/entities/product_entity.dart';

class SectionImage extends StatelessWidget {
  const SectionImage({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:
          isArabicLocale() ? Alignment.bottomLeft : Alignment.bottomRight,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.8,
          width: MediaQuery.of(context).size.width,
          child: Hero(
              tag: productEntity.idProduct,
              child: CachedNetworkImage(
                  fit: BoxFit.fill, imageUrl: productEntity.image)),
        ),
        CustomIconFavorite(productEntity: productEntity),
      ],
    );
  }
}
