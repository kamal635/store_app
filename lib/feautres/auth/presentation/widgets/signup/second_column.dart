import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/go_router.dart';
import '../shared_widget/custom_have_an_account.dart';
import '../../../../../generated/l10n.dart';

class SecondCoulmnSignUp extends StatelessWidget {
  const SecondCoulmnSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomBottomHaveAnAccount(
          title: S.of(context).alreadyHaveAccount,
          titleButton: S.of(context).loginNow,
          onPressed: () {
            context.replace(AppRouter.login);
          },
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
