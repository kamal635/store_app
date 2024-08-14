import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_bloc/delete_account_bloc/delete_account_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_bloc/forget_password_bloc/forget_password_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_bloc/google_sign_in_bloc/google_sign_in_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_bloc/login_bloc/login_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_bloc/sign_out/sign_out_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_listen_bloc/auth_listen_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/image_user_bloc/image_user_put_file/image_user_put_file_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/user_bloc/create_user_bloc/create_user_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/user_bloc/delete_user_bloc/delete_user_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/user_bloc/update_user_bloc/update_user_bloc.dart';
import 'package:store_app/feautres/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:store_app/feautres/favorite/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:store_app/feautres/localization/presntation/locale_bloc/locale_bloc.dart';
import 'package:store_app/feautres/theme/presentation/bloc/theme_app/theme_app_bloc.dart';
import 'package:store_app/generated/l10n.dart';
import 'core/function/init_flutter.dart';
import 'core/utils/dependency_injection.dart' as di;
import 'core/utils/go_router.dart';
import 'feautres/products/presentation/bloc/get_category/get_category_bloc.dart';
import 'feautres/products/presentation/bloc/status_internet/status_internet_bloc.dart';

Future<void> main() async {
  await initFlutter();
  await Future.delayed(const Duration(milliseconds: 300));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const StoreApp()));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => di.sl<GoogleSignInBloc>(),
            ),
            BlocProvider(
              create: (context) => di.sl<DeleteAccountBloc>(),
            ),
            BlocProvider(
              create: (context) => di.sl<DeleteUserBloc>(),
            ),
            BlocProvider(
              create: (context) => di.sl<ImageUserPutFileBloc>(),
            ),
            BlocProvider(
              create: (context) => di.sl<UpdateUserBloc>(),
            ),
            BlocProvider(
              create: (context) => di.sl<SignOutBloc>(),
            ),
            BlocProvider(
              create: (context) => di.sl<ForgetPasswordBloc>(),
            ),
            BlocProvider(
              create: (context) => di.sl<LoginBloc>(),
            ),
            BlocProvider(
              create: (context) => di.sl<CreateUserBloc>(),
            ),
            BlocProvider(
              create: (context) => di.sl<SignUpBloc>(),
            ),
            BlocProvider(
              create: (context) => di.sl<AuthListenBloc>(),
            ),
            BlocProvider(
              create: (context) =>
                  di.sl<AppThemeBloc>()..add(CurrentThemeEvent()),
            ),
            BlocProvider(
              create: (context) =>
                  di.sl<AppLocaleBloc>()..add(CurrentLocaleEvent()),
            ),
            BlocProvider(
              create: (context) =>
                  di.sl<GetCategoryBloc>()..add(const GetCategory()),
            ),
            BlocProvider(
              create: (context) => di.sl<StatusInternetBloc>(),
            ),
            BlocProvider(
              create: (context) =>
                  di.sl<FavoriteBloc>()..add(FavoriteStartAppEvent()),
            ),
            BlocProvider(
              create: (context) => di.sl<CartBloc>()..add(CartStartAppEvent()),
            ),
          ],
          child: BlocBuilder<AppThemeBloc, AppThemeState>(
            builder: (context, state) {
              if (state is ChangedThemeState) {
                return BlocBuilder<AppLocaleBloc, AppLocaleState>(
                  builder: (context, stateLocale) {
                    if (stateLocale is ChangeLocaleState) {
                      return MaterialApp.router(
                        localizationsDelegates: const [
                          S.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        supportedLocales: S.delegate.supportedLocales,
                        routerConfig: AppRouter.router,
                        debugShowCheckedModeBanner: false,
                        theme: state.changedTheme,
                        locale: stateLocale.locale,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      },
    );
  }
}
