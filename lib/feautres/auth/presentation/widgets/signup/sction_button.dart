import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/widgets/custom_elvated_button.dart';
import '../../bloc/auth_bloc/sign_up_bloc/sign_up_bloc.dart';
import '../../../../../generated/l10n.dart';

class SectionButtonSignUp extends StatelessWidget {
  const SectionButtonSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return SizedBox(
          height: 35.h,
          width: double.infinity,
          child: CustomElvatedButton(
            isTitle: state is SignUpLoading ? false : true,
            isRadius: false,
            colorTitle: AppColor.blacK,
            title: S.of(context).signUp,
            backgroundColor: AppColor.white,
            onPressed: () {
              BlocProvider.of<SignUpBloc>(context).add(SignUpAuthEvent());
            },
          ),
        );
      },
    );
  }
}
