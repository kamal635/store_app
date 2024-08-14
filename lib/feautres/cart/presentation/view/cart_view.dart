import 'package:flutter/material.dart';
import '../../../../core/classes/icons.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widget/body_cart_view.dart';
import '../../../../generated/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleAppbar: S.of(context).cartView,
        iconAction: AppIcon.bagShopping,
        onPressedAction: null,
        isAction: true,
      ),
      body: const CartViewBody(),
    );
  }
}
