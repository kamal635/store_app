import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/color/app_color.dart';
import 'package:store_app/core/function/toast_flutter.dart';
import 'package:store_app/core/utils/go_router.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_bloc/google_sign_in_bloc/google_sign_in_bloc.dart';

import '../../../../../core/classes/image_assets.dart';
import '../login/custom_container_facbook_or_google.dart';

class CustomGmail extends StatelessWidget {
  const CustomGmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleSignInBloc, GoogleSignInState>(
      listener: (context, state) {
        if (state is GoogleSignInFailure) {
          toast(message: state.errorMessage, color: AppColor.erorr);
        }
        if (state is GoogleSignInSuccess) {
          context.replace(AppRouter.homeView);
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            CustomContainerLoginFacebookOrGoogle(
                isImage: state is GoogleSignInILoading ? false : true,
                image: AppAssets.google,
                onTap: () {
                  BlocProvider.of<GoogleSignInBloc>(context)
                      .add(GoogleSignInTappedEvent());
                }),
          ],
        );
      },
    );
  }
}
