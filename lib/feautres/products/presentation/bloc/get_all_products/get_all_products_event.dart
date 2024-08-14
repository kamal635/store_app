part of 'get_all_products_bloc.dart';

sealed class AllProductsStateEvent extends Equatable {
  const AllProductsStateEvent();
  @override
  List<Object?> get props => [];
}

class GetAllProductsEvent extends AllProductsStateEvent {
  const GetAllProductsEvent();

  @override
  List<Object?> get props => [];
}

class SearchAllProductsEvent extends AllProductsStateEvent {
  final String query;

  const SearchAllProductsEvent({required this.query});
  @override
  List<Object> get props => [query];
}
