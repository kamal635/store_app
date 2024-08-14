import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/category_entity.dart';
import '../../../domain/use_cases/get_category_use_case.dart';

part 'get_category_event.dart';
part 'get_category_state.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, GetCategoryState> {
  final GetCategoryUseCases getCategoryUseCases;
  GetCategoryBloc({required this.getCategoryUseCases})
      : super(GetCategoryInitial()) {
    on<GetCategoryEvent>((event, emit) async {
      //================== get category event =========================
      if (event is GetCategory) {
        emit(GetCategoryLoading());
        final category = await getCategoryUseCases.call();
        category.fold((l) => emit(GetCategoryFailure(errMessage: l.message)),
            (r) => emit(GetCategorySuccess(category: r)));
      }
    });
  }
}
