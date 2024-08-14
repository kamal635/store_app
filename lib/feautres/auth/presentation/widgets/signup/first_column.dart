import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';
import '../shared_widget/custom_facebook_or_gmail.dart';
import '../shared_widget/custom_text_or_with.dart';
import '../shared_widget/custom_text_title_auth.dart';
import 'sction_button.dart';
import 'section_text_form_field.dart';

class FirstColumnSignUp extends StatelessWidget {
  const FirstColumnSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // section text welcom
        CustomTextTitleAuth(
          textSpan1: S.of(context).createAccount,
          textSpan2: S.of(context).toGetStarted,
        ),

        SizedBox(
          height: 25.h,
        ),

        // section TextFormField
        const SectionTextFormFieldSignUp(),

        SizedBox(
          height: 30.h,
        ),

        // section button
        const SectionButtonSignUp(),

        SizedBox(
          height: 50.h,
        ),

        // section Text or login with
        CustomTextOrWith(title: S.of(context).orSignUp),

        SizedBox(
          height: 25.h,
        ),

        // section google or facebook
        const CustomGmail(),
      ],
    );
  }
}
