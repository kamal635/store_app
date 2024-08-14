part of 'get_products_of_category_bloc.dart';

sealed class GetProductsOfCategoryState extends Equatable {
  const GetProductsOfCategoryState();

  @override
  List<Object> get props => [];
}

final class GetProductsOfCategoryInitial extends GetProductsOfCategoryState {}

final class GetProductsOfCategoryLoading extends GetProductsOfCategoryState {}

final class GetProductsOfCategorySuccess extends GetProductsOfCategoryState {
  final List<ProductEntity> listProducts;

  const GetProductsOfCategorySuccess({required this.listProducts});
  @override
  List<Object> get props => [listProducts];
}

final class GetProductsOfCategoryFailure extends GetProductsOfCategoryState {
  final String errorMessage;

  const GetProductsOfCategoryFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
