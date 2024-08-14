part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

//================ start app event ====================
class CartStartAppEvent extends CartEvent {}

//================ add to cart event ====================
class AddToCartEvent extends CartEvent {
  final ProductEntity productEntity;

  const AddToCartEvent({required this.productEntity});
  @override
  List<Object> get props => [productEntity];
}

//================ remove from cart event ====================
class RemoveFromCartEvent extends CartEvent {
  final ProductEntity productEntity;

  const RemoveFromCartEvent({required this.productEntity});
  @override
  List<Object> get props => [productEntity];
}

//================ clear all from cart event ====================
class ClearAllFromCartEvent extends CartEvent {}

//================ remove index item  event ====================
class RemoveIndexFromCart extends CartEvent {
  final ProductEntity productEntity;

  const RemoveIndexFromCart({required this.productEntity});
  @override
  List<Object> get props => [productEntity];
}

//================ search by query event ====================
class SearchInCartEvent extends CartEvent {
  final String query;

  const SearchInCartEvent({required this.query});
  @override
  List<Object> get props => [query];
}
