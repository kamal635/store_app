import '../../../products/domain/entities/product_entity.dart';

class CartEntity {
  final List<ProductEntity> listProductEntity;

  const CartEntity({this.listProductEntity = const <ProductEntity>[]});

  Map<ProductEntity, int> updateQuantity(
      {required List<ProductEntity> productEntity}) {
    var productQuantities = <ProductEntity, int>{};
    for (var product in productEntity) {
      if (!productQuantities.containsKey(product)) {
        productQuantities[product] = 1;
      } else {
        productQuantities[product] = (productQuantities[product] ?? 0) + 1;
      }
    }
    return productQuantities;
  }

  double get subTotalPrice => listProductEntity.fold(
      0, (previousValue, product) => previousValue + product.priceProduct);

  double get shippingPrice => (subTotalPrice * 3.5) / 100;
  double get bagTotal => shippingPrice + subTotalPrice;

  String get stringSubTotal => subTotalPrice.toStringAsFixed(2);
  String get stringShippingPrice => shippingPrice.toStringAsFixed(2);
  String get stringBagTotal => bagTotal.toStringAsFixed(2);
}
