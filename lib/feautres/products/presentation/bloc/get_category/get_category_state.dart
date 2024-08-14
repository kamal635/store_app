part of 'get_category_bloc.dart';

sealed class GetCategoryState {}

final class GetCategoryInitial extends GetCategoryState {}

final class GetCategoryLoading extends GetCategoryState {}

final class GetCategorySuccess extends GetCategoryState {
  final List<CategoryEntity> category;

  GetCategorySuccess({required this.category});
}

final class GetCategoryFailure extends GetCategoryState {
  final String errMessage;

  GetCategoryFailure({required this.errMessage});
}
