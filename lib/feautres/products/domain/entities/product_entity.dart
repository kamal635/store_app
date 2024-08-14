import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 1)
class ProductEntity extends Equatable {
  @HiveField(0)
  final int idProduct;
  @HiveField(1)
  final String titleProduct;
  @HiveField(2)
  final String descriptionProduct;
  @HiveField(3)
  final num priceProduct;
  @HiveField(4)
  final num discountPercentageProduct;
  @HiveField(5)
  final num ratingProduct;
  @HiveField(6)
  final num stockProduct;
  @HiveField(7)
  final String brandProduct;
  @HiveField(8)
  final String categoryProduct;
  @HiveField(9)
  final String image;
  @HiveField(10)
  final List<dynamic> subImage;

  const ProductEntity({
    required this.idProduct,
    required this.titleProduct,
    required this.descriptionProduct,
    required this.priceProduct,
    required this.discountPercentageProduct,
    required this.ratingProduct,
    required this.stockProduct,
    required this.brandProduct,
    required this.categoryProduct,
    required this.image,
    required this.subImage,
  });

  @override
  List<Object?> get props => [
        idProduct,
        titleProduct,
        descriptionProduct,
        priceProduct,
        discountPercentageProduct,
        ratingProduct,
        stockProduct,
        brandProduct,
        categoryProduct,
        image,
        subImage,
      ];
}
