import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/dependency_injection.dart' as di;
import '../../../../core/widgets/custom_appbar.dart';
import '../bloc/get_all_products/get_all_products_bloc.dart';
import '../widgets/search_home/search_home_body.dart';
import '../../../../generated/l10n.dart';

class SearchHomeView extends StatelessWidget {
  const SearchHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressedLeading: () {
          context.pop();
        },
        isLeading: true,
        titleAppbar: S.of(context).search,
      ),
      body: BlocProvider(
        create: (context) =>
            di.sl<AllProductsBloc>()..add(const GetAllProductsEvent()),
        child: const SearchHomeViewBody(),
      ),
    );
  }
}
