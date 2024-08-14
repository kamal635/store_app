part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final FavoriteEntity favoriteEntity;

  const FavoriteSuccess({this.favoriteEntity = const FavoriteEntity()});
  @override
  List<Object> get props => [favoriteEntity];
}

final class FavoriteFailure extends FavoriteState {
  final String errorMessage;

  const FavoriteFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
