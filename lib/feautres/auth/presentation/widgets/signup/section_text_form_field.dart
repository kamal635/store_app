import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/classes/icons.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../bloc/auth_bloc/sign_up_bloc/sign_up_bloc.dart';
import '../../../../../generated/l10n.dart';

class SectionTextFormFieldSignUp extends StatelessWidget {
  const SectionTextFormFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return CustomTextFormField(
              errorText:
                  state is SignUpEmailFailure ? (state).errorEmail : null,
              onChanged: (value) {
                BlocProvider.of<SignUpBloc>(context)
                    .add(SignUpEmailChangedEvent(email: value));
              },
              prefixIcon: AppIcon.email,
              fillColor: AppColor.lightGrey.withAlpha(170),
              isRaiusEnabled: false,
              isRaiusfocused: false,
              hint: S.of(context).emailAddress,
            );
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return CustomTextFormField(
              errorText:
                  state is SignUpPasswordFailure ? (state).errorPassword : null,
              onChanged: (value) {
                BlocProvider.of<SignUpBloc>(context)
                    .add(SignUpPasswordChangedEvent(password: value));
              },
              prefixIcon: AppIcon.password,
              fillColor: AppColor.lightGrey.withAlpha(170),
              isRaiusEnabled: false,
              isRaiusfocused: false,
              hint: S.of(context).password,
            );
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return CustomTextFormField(
              errorText: state is SignUpConfirmPasswordFailure
                  ? (state).errorConfirmPassword
                  : null,
              onChanged: (value) {
                BlocProvider.of<SignUpBloc>(context).add(
                    SignUpConfirmPasswordChangedEvent(confirmPassword: value));
              },
              prefixIcon: AppIcon.password,
              fillColor: AppColor.lightGrey.withAlpha(170),
              isRaiusEnabled: false,
              isRaiusfocused: false,
              hint: S.of(context).confirmPassword,
            );
          },
        ),
      ],
    );
  }
}
