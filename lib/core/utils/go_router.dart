import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/feautres/auth/presentation/view/profile/my_information.dart';
import '../../feautres/auth/presentation/view/change_pass_note.dart';
import '../../feautres/auth/presentation/view/forget_passwod.dart';
import '../../feautres/auth/presentation/view/login.dart';
import '../../feautres/auth/presentation/view/signup.dart';
import '../../feautres/products/domain/entities/category_entity.dart';
import '../../feautres/products/presentation/view/product_category_view.dart';
import '../../feautres/products/presentation/view/search_home_view.dart';
import '../../feautres/products/presentation/view/settings_view.dart';
import '../../feautres/start_app/presentation/view/choose_language_view.dart';
import '../../feautres/start_app/presentation/view/login_or_skip.dart';
import '../../feautres/start_app/presentation/view/onbording_view.dart';
import '../../feautres/start_app/presentation/view/splash_view.dart';
import 'dependency_injection.dart' as di;
import '../../feautres/products/domain/entities/product_entity.dart';
import '../../feautres/products/presentation/bloc/get_all_products/get_all_products_bloc.dart';
import '../../feautres/cart/presentation/view/cart_view.dart';
import '../../feautres/products/presentation/view/details_product_view.dart';
import '../../feautres/favorite/presentation/view/favorite_view.dart';
import '../../feautres/products/presentation/view/home_view.dart';
import '../../feautres/auth/presentation/view/profile/profile_view.dart';

abstract class AppRouter {
  static const String cartView = "/cartView";
  static const String favoriteView = "/favoriteView";
  static const String profileView = "/profileView";
  static const String detailsProductView = "/detailsProductView";
  static const String homeView = "/homeView";
  static const String onBordingView = "/onBordingView";
  static const String chooseLanguageView = "/chooseLanguageView";
  static const String loginOrSkip = "/loginOrSkip";
  static const String settings = "/settings";
  static const String productCategory = "/productCategory";
  static const String searchHomeView = "/searchHomeView";
  static const String login = "/login";
  static const String signUp = "/signUp";
  static const String forgetPassword = "/forgetPassword";
  static const String noteChangePassword = "/noteChangePassword";
  static const String myInformationView = "/myInformationView";

  static final router = GoRouter(
    routes: [
      // GoRoute(path: "/", builder: (context, state) => const Testt()),

      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRouter.noteChangePassword,
        builder: (context, state) => const NoteChangePasswordView(),
      ),
      GoRoute(
        path: AppRouter.myInformationView,
        builder: (context, state) => const MyInformationView(),
      ),
      GoRoute(
        path: AppRouter.forgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: AppRouter.signUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: AppRouter.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRouter.loginOrSkip,
        builder: (context, state) => const LoginOrSkip(),
      ),
      GoRoute(
        path: AppRouter.chooseLanguageView,
        builder: (context, state) => const ChooseLanguageView(),
      ),
      GoRoute(
        path: AppRouter.searchHomeView,
        builder: (context, state) => const SearchHomeView(),
      ),
      GoRoute(
        path: AppRouter.onBordingView,
        builder: (context, state) => const OnBordingView(),
      ),
      GoRoute(
        path: AppRouter.productCategory,
        builder: (context, state) =>
            ProductCategoryView(categoryEntity: state.extra as CategoryEntity),
      ),
      GoRoute(
        path: AppRouter.settings,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: AppRouter.homeView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              di.sl<AllProductsBloc>()..add(const GetAllProductsEvent()),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: AppRouter.cartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: AppRouter.favoriteView,
        builder: (context, state) => const FavoriteView(),
      ),
      GoRoute(
        path: AppRouter.profileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: AppRouter.detailsProductView,
        builder: (context, state) =>
            DetailsProductView(productEntity: state.extra as ProductEntity),
      ),
    ],
  );
}
