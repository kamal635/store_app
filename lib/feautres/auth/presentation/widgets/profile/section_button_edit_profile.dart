import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/fonts/app_font.dart';
import 'package:store_app/core/utils/go_router.dart';
import 'package:store_app/core/widgets/custom_elvated_button.dart';
import 'package:store_app/generated/l10n.dart';

class SectionButtonEditProfile extends StatelessWidget {
  const SectionButtonEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElvatedButton(
          onPressed: () {
            context.push(AppRouter.myInformationView);
          },
          title: S.of(context).ediProfile,
          fontTitle: AppFonts.bold_14,
          isRadius: false,
        ),
      ],
    );
  }
}
