part of 'get_products_of_category_bloc.dart';

sealed class GetProductsOfCategoryEvent extends Equatable {
  const GetProductsOfCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetProductsOfCategoryNameEvent extends GetProductsOfCategoryEvent {
  final String nameCategory;

  const GetProductsOfCategoryNameEvent({required this.nameCategory});
  @override
  List<Object> get props => [nameCategory];
}

class GetProductsOfCategorySearchQueryEvent extends GetProductsOfCategoryEvent {
  final String query;

  const GetProductsOfCategorySearchQueryEvent({required this.query});
  @override
  List<Object> get props => [query];
}
