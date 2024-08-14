import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/classes/image_assets.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/fonts/app_font.dart';
import '../../../../../core/function/toast_flutter.dart';
import '../../../../../core/utils/go_router.dart';
import '../../bloc/auth_bloc/forget_password_bloc/forget_password_bloc.dart';
import 'section_button.dart';
import 'section_form_field.dart';
import '../shared_widget/custom_text_title_auth.dart';
import '../../../../../generated/l10n.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordFailure) {
          toast(message: state.errorMessage, color: AppColor.erorr);
        }
        if (state is ForgetPasswordSuccess) {
          context.replace(AppRouter.noteChangePassword);
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration:
                        BoxDecoration(gradient: AppColor.linearGradient()),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.lock,
                            height: 80.h,
                            width: 80.h,
                          ),

                          SizedBox(
                            height: 25.h,
                          ),

                          // section text welcom
                          CustomTextTitleAuth(
                            fontSpan1:
                                AppFonts.bold_18.copyWith(fontFamily: "Cairo"),
                            fontSpan2: AppFonts.regular_14
                                .copyWith(fontFamily: "Cairo"),
                            textSpan1: S.of(context).forgetPass,
                            textSpan2: S.of(context).titleForgetpassword,
                          ),

                          SizedBox(
                            height: 25.h,
                          ),

                          // section TextFormField
                          const SectionTextFormFieldForgetPassword(),

                          SizedBox(
                            height: 30.h,
                          ),

                          // section button
                          const SectionButtonForgetPassword(),

                          // section have an account
                        ],
                      ),
                    ),
                  ),
                  state is ForgetPasswordLoading
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          color: AppColor.grey.withAlpha(80),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
