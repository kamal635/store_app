part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

//================ loading ====================
final class CartLoading extends CartState {}

//================ success ====================
final class CartSuccess extends CartState {
  final CartEntity cartEntity;

  const CartSuccess({this.cartEntity = const CartEntity()});
  @override
  List<Object> get props => [cartEntity];
}

//================ failure ====================
final class CartFailure extends CartState {
  final String errorMessage;

  const CartFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
