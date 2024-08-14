import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../../../core/classes/image_assets.dart';
import '../../../../core/color/app_color.dart';
import '../../../../core/utils/go_router.dart';
import '../../../auth/presentation/bloc/auth_listen_bloc/auth_listen_bloc.dart';
import '../../data/local_data_source/save_start_app.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    //========= animate logo ==============
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward();

    Timer(const Duration(seconds: 2), () async {
      Box box = await SaveStartViewAppLocal.openBox();
      final bool loginOrRegister =
          SaveStartViewAppLocal.getLoginOrRegister(box);
      final bool chooseLanguage = SaveStartViewAppLocal.getChooseLanguage(box);
      final bool onBording = SaveStartViewAppLocal.getOnBording(box);

      //check view is open first time or not
      if (chooseLanguage == false &&
          onBording == false &&
          loginOrRegister == false) {
        //if all false go to login or register view
        if (!context.mounted) return;
        context.replace(AppRouter.chooseLanguageView);
        //if (login or register view == true) go to choose language view
      } else if (chooseLanguage == true &&
          onBording == false &&
          loginOrRegister == false) {
        if (!context.mounted) return;
        context.replace(AppRouter.onBordingView);

        //if (login or register view == true and choose language view == true)
        //go to onbording view
      } else if (chooseLanguage == true &&
          onBording == true &&
          loginOrRegister == false) {
        if (!context.mounted) return;
        context.replace(AppRouter.loginOrSkip);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthListenBloc, AuthListenState>(
        listener: (context, state) async {
          Box box = await SaveStartViewAppLocal.openBox();
          final bool loginOrRegister =
              SaveStartViewAppLocal.getLoginOrRegister(box);
          final bool chooseLanguage =
              SaveStartViewAppLocal.getChooseLanguage(box);
          final bool onBording = SaveStartViewAppLocal.getOnBording(box);

          if (chooseLanguage == true &&
              onBording == true &&
              loginOrRegister == true) {
            if (state.status == AuthStatus.authenticated) {
              if (!context.mounted) return;
              context.replace(AppRouter.homeView);
            } else if (state.status == AuthStatus.unauthenticated) {
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  context.replace(AppRouter.login);
                },
              );
            }
          }
        },
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            decoration: BoxDecoration(gradient: AppColor.linearGradient()),
            child: Center(
              child: Image.asset(
                AppAssets.logoApp,
                height: 250.h,
                width: 250.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
