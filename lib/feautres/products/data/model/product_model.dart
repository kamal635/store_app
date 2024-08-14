// ignore_for_file: must_be_immutable

import 'package:store_app/feautres/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<dynamic>? images;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  }) : super(
            idProduct: id!,
            titleProduct: title ?? "",
            descriptionProduct: description ?? "",
            priceProduct: price!,
            discountPercentageProduct: discountPercentage ?? 0,
            ratingProduct: rating ?? 0,
            stockProduct: stock ?? 0,
            brandProduct: brand ?? "",
            categoryProduct: category ?? "",
            image: thumbnail ?? "",
            subImage: images ?? <dynamic>[]);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
        rating: (json['rating'] as num?)?.toDouble(),
        stock: json['stock'] as int?,
        brand: json['brand'] as String?,
        category: json['category'] as String?,
        thumbnail: json['thumbnail'] as String?,
        images: json['images'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'brand': brand,
        'category': category,
        'thumbnail': thumbnail,
        'images': images,
      };
}
