import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/widgets/custom_appbar.dart';
import 'package:store_app/feautres/auth/presentation/widgets/profile/my_information/body_my_information.dart';
import 'package:store_app/generated/l10n.dart';

class MyInformationView extends StatelessWidget {
  const MyInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isLeading: true,
        onPressedLeading: () {
          context.pop();
        },
        titleAppbar: S.of(context).myInfo,
      ),
      body: const MyInformationViewBody(),
    );
  }
}
