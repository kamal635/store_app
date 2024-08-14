import 'package:hive/hive.dart';

import '../../../../../core/utils/api_services.dart';
import '../../model/product_model.dart';
import '../local_data_source.dart/products_local_data_source.dart';

abstract class AllProductsRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

class AllProductsRemoteDataSourceImpl extends AllProductsRemoteDataSource {
  final ApiService apiService;
  final AllProductsLocalDataSourceImpl productsLocalDataSourceImpl;

  AllProductsRemoteDataSourceImpl({
    required this.apiService,
    required this.productsLocalDataSourceImpl,
  });

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final data = await apiService.get(endPoint: "products");

    List<ProductModel> products = getProducts(data);
    await addAllProductsToLocal(products);
    return products;
  }

//method add products to box in local storage
  Future<void> addAllProductsToLocal(List<ProductModel> products) async {
    Box box = await productsLocalDataSourceImpl.openBox();
    await productsLocalDataSourceImpl.addAllProducts(box, products);
  }

//method parse Map<String, dynamic> to  ProductEntity
  List<ProductModel> getProducts(Map<String, dynamic> data) {
    List<ProductModel> products = [];
    for (var item in data["products"]) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }
}
