import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/dependency_injection.dart' as di;
import '../../../../core/widgets/custom_appbar.dart';
import '../../domain/entities/category_entity.dart';
import '../bloc/get_products_of_category/get_products_of_category_bloc.dart';
import '../widgets/products_of_category/body_products_of_category.dart';

class ProductCategoryView extends StatelessWidget {
  const ProductCategoryView({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isLeading: true,
        onPressedLeading: () {
          context.pop();
        },
        titleAppbar: categoryEntity.categoryName,
      ),
      body: BlocProvider(
        create: (context) => di.sl<GetProductsOfCategoryBloc>()
          ..add(GetProductsOfCategoryNameEvent(
              nameCategory: categoryEntity.categoryName)),
        child: ProductCategoryBody(nameCategory: categoryEntity.categoryName),
      ),
    );
  }
}
