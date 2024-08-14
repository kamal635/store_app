import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/widgets/custom_elvated_button.dart';
import '../../bloc/auth_bloc/login_bloc/login_bloc.dart';
import '../../../../../generated/l10n.dart';

class SectionButtonLogin extends StatelessWidget {
  const SectionButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return SizedBox(
          height: 35.h,
          width: double.infinity,
          child: CustomElvatedButton(
            isTitle: state is LoginLoaing ? false : true,
            isRadius: false,
            colorTitle: AppColor.blacK,
            title: S.of(context).login,
            backgroundColor: AppColor.white,
            onPressed: () {
              FocusScope.of(context).unfocus();
              BlocProvider.of<LoginBloc>(context).add(LoginAuthEvent());
            },
          ),
        );
      },
    );
  }
}
