part of 'get_category_bloc.dart';

sealed class GetCategoryEvent {
  const GetCategoryEvent();
}

class GetCategory extends GetCategoryEvent {
  const GetCategory();
}
