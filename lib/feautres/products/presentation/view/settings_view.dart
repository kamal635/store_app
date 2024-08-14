import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../generated/l10n.dart';
import '../widgets/drawer/settings/body_settings.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressedLeading: () {
          context.pop();
        },
        isCircleOnLeading: false,
        isLeading: true,
        titleAppbar: S.of(context).settings,
      ),
      body: const BodySettings(),
    );
  }
}
