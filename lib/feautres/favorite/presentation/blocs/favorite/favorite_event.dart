part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

//========================== start app event ==========================
class FavoriteStartAppEvent extends FavoriteEvent {}

//========================== add favorite event ==========================
class AddFavoriteEvent extends FavoriteEvent {
  final ProductEntity productEntity;

  const AddFavoriteEvent({required this.productEntity});
  @override
  List<Object> get props => [productEntity];
}

//========================== remove favorite event ==========================
class RemoveFavoriteEvent extends FavoriteEvent {
  final ProductEntity productEntity;

  const RemoveFavoriteEvent({required this.productEntity});
  @override
  List<Object> get props => [productEntity];
}

//========================== clear favorite event ==========================
class RemoveAllFavoriteEvent extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

//========================== search favorite event ==========================
class SearchFavoriteEvent extends FavoriteEvent {
  final String query;

  const SearchFavoriteEvent({required this.query});
  @override
  List<Object> get props => [query];
}
