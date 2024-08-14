import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/classes/icons.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../bloc/auth_bloc/forget_password_bloc/forget_password_bloc.dart';
import '../../../../../generated/l10n.dart';

class SectionTextFormFieldForgetPassword extends StatelessWidget {
  const SectionTextFormFieldForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
          builder: (context, state) {
            return CustomTextFormField(
              onChanged: (value) {
                BlocProvider.of<ForgetPasswordBloc>(context)
                    .add(ForgetPasswrodChangedEmailEvent(email: value));
              },
              errorText:
                  state is ForgetPasswordEmailFailure ? state.errorEmail : null,
              prefixIcon: AppIcon.email,
              fillColor: AppColor.lightGrey.withAlpha(170),
              isRaiusEnabled: false,
              isRaiusfocused: false,
              hint: S.of(context).emailAddress,
            );
          },
        ),
      ],
    );
  }
}
