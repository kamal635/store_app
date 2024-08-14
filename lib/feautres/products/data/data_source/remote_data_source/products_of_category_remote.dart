import '../../../../../core/utils/api_services.dart';
import '../../model/product_model.dart';
import '../local_data_source.dart/products_of_category_local.dart';

abstract class GetProductsOfCategoryRemoteDataSource {
  Future<List<ProductModel>> getProductsOfCategory(String nameCategory);
}

class GetProductsOfCategoryRemoteDataSourceImpl
    implements GetProductsOfCategoryRemoteDataSource {
  final ApiService apiService;
  final GetProductsOfCategoryLocalDataSourceImpl gerProductsLocal;
  GetProductsOfCategoryRemoteDataSourceImpl({
    required this.apiService,
    required this.gerProductsLocal,
  });
  @override
  Future<List<ProductModel>> getProductsOfCategory(String nameCategory) async {
    final data =
        await apiService.get(endPoint: "products/category/$nameCategory");
//===================== method get from api =======================
    List<ProductModel> listProducts = _getProductFromApi(data);
    //===================== method save local =======================
    await _saveProductsInLocal(nameCategory, listProducts);
    return listProducts;
  }

//===================== method save local =======================
  Future<void> _saveProductsInLocal(
      String nameCategory, List<ProductModel> listProducts) async {
    final box = await gerProductsLocal.openBox();
    await gerProductsLocal.addProducts(box, listProducts);
  }

//===================== method get from api =======================
  List<ProductModel> _getProductFromApi(Map<String, dynamic> data) {
    List<ProductModel> listProducts = [];

    for (var item in data["products"]) {
      listProducts.add(ProductModel.fromJson(item));
    }
    return listProducts;
  }
}
