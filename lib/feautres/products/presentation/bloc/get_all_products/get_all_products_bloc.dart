import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_entity.dart';
import '../../../domain/use_cases/get_all_products_use_case.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

class AllProductsBloc extends Bloc<AllProductsStateEvent, AllProductsState> {
  final AllProductsUseCase getProductOfCategoryUseCase;

  AllProductsBloc({
    required this.getProductOfCategoryUseCase,
  }) : super(AllProductsStateInitial()) {
    on<AllProductsStateEvent>((event, emit) async {
      //================== get all products event =========================
      if (event is GetAllProductsEvent) {
        emit(AllProductsStateLoading());
        final getProducts = await getProductOfCategoryUseCase.call();
        getProducts.fold(
            (l) => emit(AllProductsStateFailure(errMessage: l.message)),
            (r) => emit(AllProductsStateSuccess(products: r)));
      }
      //================ get products search event =================
      else if (event is SearchAllProductsEvent) {
        emit(AllProductsStateLoading());
        final getProducts = await getProductOfCategoryUseCase.call();
        getProducts.fold((l) {
          emit(AllProductsStateFailure(errMessage: l.message));
        }, (r) {
          if (event.query.isNotEmpty) {
            final listProduct = r
                .where((products) =>
                    products.titleProduct.toLowerCase().contains(event.query))
                .toList();
            emit(AllProductsStateSearch(products: listProduct));
          } else {
            emit(AllProductsStateSearch(products: const []));
          }
        });
      }
    });
  }
}
