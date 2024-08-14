import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/custom_appbar.dart';
import 'package:store_app/feautres/auth/presentation/widgets/profile/body_profile.dart';

import 'package:store_app/generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleAppbar: S.of(context).profile,
      ),
      body: const ProfileViewBody(),
    );
  }
}
