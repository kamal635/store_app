import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/classes/icons.dart';
import '../../../../core/utils/go_router.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widget/body_favorite_view.dart';
import '../../../../generated/l10n.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconAction: AppIcon.bagShopping,
        isAction: true,
        titleAppbar: S.of(context).favoriteView,
        onPressedAction: () {
          context.push(AppRouter.cartView);
        },
      ),
      body: const FavoriteViewBody(),
    );
  }
}
