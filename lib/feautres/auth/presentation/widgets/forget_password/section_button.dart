import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/widgets/custom_elvated_button.dart';
import '../../bloc/auth_bloc/forget_password_bloc/forget_password_bloc.dart';
import '../../../../../generated/l10n.dart';

class SectionButtonForgetPassword extends StatelessWidget {
  const SectionButtonForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: double.infinity,
      child: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
        builder: (context, state) {
          return CustomElvatedButton(
            isTitle: state is ForgetPasswordLoading ? false : true,
            isRadius: false,
            colorTitle: AppColor.blacK,
            title: S.of(context).send,
            backgroundColor: AppColor.white,
            onPressed: () {
              BlocProvider.of<ForgetPasswordBloc>(context)
                  .add(ForgetPasswrodTappedEvent());
              // context.replace(AppRouter.successChangePassword);
            },
          );
        },
      ),
    );
  }
}
