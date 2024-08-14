import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/use_cases/get_products_of_category.dart';
part 'get_products_of_category_event.dart';
part 'get_products_of_category_state.dart';

class GetProductsOfCategoryBloc
    extends Bloc<GetProductsOfCategoryEvent, GetProductsOfCategoryState> {
  final GetProductsOfCategoryUseCase getProductsUseCase;

  GetProductsOfCategoryBloc({required this.getProductsUseCase})
      : super(GetProductsOfCategoryInitial()) {
    on<GetProductsOfCategoryEvent>((event, emit) async {
      //================ get products of category event ==============
      if (event is GetProductsOfCategoryNameEvent) {
        emit(GetProductsOfCategoryLoading());
        final products = await getProductsUseCase.call(event.nameCategory);
        products.fold((l) {
          return emit(GetProductsOfCategoryFailure(errorMessage: l.message));
        }, (r) {
          return emit(GetProductsOfCategorySuccess(listProducts: r));
        });
      }
      //================ get products search event =================
      if (event is GetProductsOfCategorySearchQueryEvent) {
        try {
          List<ProductEntity> listFilter =
              (state as GetProductsOfCategorySuccess)
                  .listProducts
                  .where((element) => element.titleProduct == event.query)
                  .toList();
          emit(GetProductsOfCategorySuccess(listProducts: listFilter));
        } on Exception {
          emit(const GetProductsOfCategoryFailure(
              errorMessage: "There was an error when search"));
        }
      }
    });
  }
}
