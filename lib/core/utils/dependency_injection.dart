import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/feautres/auth/data/data_source/remote_data_source/auth_remote/auth_delete_account_remote.dart';
import 'package:store_app/feautres/auth/data/data_source/remote_data_source/auth_remote/auth_google_sign_in_remote.dart';
import 'package:store_app/feautres/auth/data/data_source/remote_data_source/image_user_remote/image_user_put_file.dart';
import 'package:store_app/feautres/auth/data/data_source/remote_data_source/user_remote/delete_user_remote.dart';
import 'package:store_app/feautres/auth/data/data_source/remote_data_source/user_remote/update_user_remote.dart';
import 'package:store_app/feautres/auth/data/repository/auth_repository/auth_delete_account_repo_impl.dart';
import 'package:store_app/feautres/auth/data/repository/auth_repository/auth_google_sign_in_repo_impl.dart';
import 'package:store_app/feautres/auth/data/repository/image_user_reository/image_user_put_file_repo_impl.dart';
import 'package:store_app/feautres/auth/data/repository/user_repository/delete_user_repo_impl.dart';
import 'package:store_app/feautres/auth/data/repository/user_repository/update_user_repo_impl.dart';
import 'package:store_app/feautres/auth/domain/repository/auth_repository/auth_delete_account_repo.dart';
import 'package:store_app/feautres/auth/domain/repository/auth_repository/auth_google_sign_in_repo.dart';
import 'package:store_app/feautres/auth/domain/repository/image_user_repository/image_user_put_file.dart';
import 'package:store_app/feautres/auth/domain/repository/user_repository/delete_user_repo.dart';
import 'package:store_app/feautres/auth/domain/repository/user_repository/update_user_repo.dart';
import 'package:store_app/feautres/auth/domain/use_cases/auth_use_case/auth_delete_account_user_case.dart';
import 'package:store_app/feautres/auth/domain/use_cases/auth_use_case/auth_google_sign_in_use_case.dart';
import 'package:store_app/feautres/auth/domain/use_cases/image_user_use_case/image_user_put_file.dart';
import 'package:store_app/feautres/auth/domain/use_cases/user_use_case/delete_user_use_case.dart';
import 'package:store_app/feautres/auth/domain/use_cases/user_use_case/update_user_use_case.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_bloc/delete_account_bloc/delete_account_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_bloc/google_sign_in_bloc/google_sign_in_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/image_user_bloc/image_user_put_file/image_user_put_file_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/user_bloc/delete_user_bloc/delete_user_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/user_bloc/update_user_bloc/update_user_bloc.dart';
import '../../feautres/auth/data/data_source/remote_data_source/auth_remote/auth_forget_password_remote.dart';
import '../../feautres/auth/data/data_source/remote_data_source/auth_remote/auth_get_user_remote.dart';
import '../../feautres/auth/data/data_source/remote_data_source/auth_remote/auth_login_remote.dart';
import '../../feautres/auth/data/data_source/remote_data_source/auth_remote/auth_sign_out_remote.dart';
import '../../feautres/auth/data/data_source/remote_data_source/auth_remote/auth_sign_up_remote.dart';
import '../../feautres/auth/data/data_source/remote_data_source/user_remote/create_user_remote.dart';
import '../../feautres/auth/data/data_source/remote_data_source/user_remote/get_user_remote.dart';
import '../../feautres/auth/data/repository/auth_repository/auth_forget_password_repo_impl.dart';
import '../../feautres/auth/data/repository/auth_repository/auth_get_user_repo_impl.dart';
import '../../feautres/auth/data/repository/auth_repository/auth_login_repo_impl.dart';
import '../../feautres/auth/data/repository/auth_repository/auth_sign_out_repo_impl.dart';
import '../../feautres/auth/data/repository/auth_repository/auth_signup_repo_impl.dart';
import '../../feautres/auth/data/repository/user_repository/create_user_repo_impl.dart';
import '../../feautres/auth/data/repository/user_repository/get_user_repo_impl.dart';
import '../../feautres/auth/domain/repository/auth_repository/auth_forget_password_repo.dart';
import '../../feautres/auth/domain/repository/auth_repository/auth_get_user_repo.dart';
import '../../feautres/auth/domain/repository/auth_repository/auth_login_user_repo.dart';
import '../../feautres/auth/domain/repository/auth_repository/auth_sign_out_repo.dart';
import '../../feautres/auth/domain/repository/auth_repository/auth_sign_up_repo.dart';
import '../../feautres/auth/domain/repository/user_repository/create_user_repo.dart';
import '../../feautres/auth/domain/repository/user_repository/get_user_repo.dart';
import '../../feautres/auth/domain/use_cases/auth_use_case/auth_forget_password_use_case.dart';
import '../../feautres/auth/domain/use_cases/auth_use_case/auth_get_user_use_case.dart';
import '../../feautres/auth/domain/use_cases/auth_use_case/auth_login_use_case.dart';
import '../../feautres/auth/domain/use_cases/auth_use_case/auth_sign_out_use_case.dart';
import '../../feautres/auth/domain/use_cases/auth_use_case/auth_sign_up_use_case.dart';
import '../../feautres/auth/domain/use_cases/user_use_case/create_user_use_case.dart';
import '../../feautres/auth/domain/use_cases/user_use_case/get_user_use_case.dart';
import '../../feautres/auth/presentation/bloc/auth_bloc/forget_password_bloc/forget_password_bloc.dart';
import '../../feautres/auth/presentation/bloc/auth_bloc/login_bloc/login_bloc.dart';
import '../../feautres/auth/presentation/bloc/auth_bloc/sign_out/sign_out_bloc.dart';
import '../../feautres/auth/presentation/bloc/auth_bloc/sign_up_bloc/sign_up_bloc.dart';
import '../../feautres/auth/presentation/bloc/auth_listen_bloc/auth_listen_bloc.dart';
import '../../feautres/auth/presentation/bloc/user_bloc/create_user_bloc/create_user_bloc.dart';
import '../../feautres/cart/data/local_data_source/cart_local_data_source.dart';
import '../../feautres/cart/presentation/bloc/cart/cart_bloc.dart';
import '../../feautres/favorite/data/local_data_source/favorite_local_data_source.dart';
import '../../feautres/favorite/presentation/blocs/favorite/favorite_bloc.dart';
import '../../feautres/localization/data/local_data_source/locale_local_data_source.dart';
import '../../feautres/localization/presntation/locale_bloc/locale_bloc.dart';
import '../../feautres/products/data/data_source/local_data_source.dart/products_of_category_local.dart';
import '../../feautres/products/data/data_source/remote_data_source/products_of_category_remote.dart';
import '../../feautres/products/data/repository/get_products_of_category_impl.dart';
import '../../feautres/products/domain/repository/repo_product_of_category.dart';
import '../../feautres/products/domain/use_cases/get_products_of_category.dart';
import '../../feautres/products/presentation/bloc/get_products_of_category/get_products_of_category_bloc.dart';
import '../../feautres/theme/presentation/bloc/theme_app/theme_app_bloc.dart';
import 'api_services.dart';
import '../../feautres/products/data/data_source/local_data_source.dart/category_local_data_source.dart';
import '../../feautres/products/data/data_source/local_data_source.dart/products_local_data_source.dart';
import '../../feautres/theme/data/local_data_source/theme_local_data_source.dart';
import '../../feautres/products/data/data_source/remote_data_source/category_remote_data_source.dart';
import '../../feautres/products/data/data_source/remote_data_source/all_products.dart';
import '../../feautres/products/data/repository/repo_category_impl.dart';
import '../../feautres/products/domain/repository/repo_category.dart';
import '../../feautres/products/domain/repository/repo_product.dart';
import '../../feautres/products/domain/use_cases/get_category_use_case.dart';
import '../../feautres/products/domain/use_cases/get_all_products_use_case.dart';
import '../../feautres/products/presentation/bloc/get_all_products/get_all_products_bloc.dart';
import '../../feautres/products/presentation/bloc/get_category/get_category_bloc.dart';
import '../../feautres/products/presentation/bloc/status_internet/status_internet_bloc.dart';
import '../../feautres/products/data/repository/repo_product_of_category_impl.dart';

final sl = GetIt.instance;

Future<void> initGetIt() async {
  //! Bloc

  sl.registerFactory(
      () => GoogleSignInBloc(authGoogleSignInUseCase: sl.call()));
  sl.registerFactory(() => DeleteUserBloc(
        deleteUserUseCase: sl.call(),
        authListenBloc: sl.call(),
        deleteAccountBloc: sl.call(),
      ));
  sl.registerFactory(() => DeleteAccountBloc(
        authDeleteAccountUseCase: sl.call(),
      ));
  sl.registerFactory(() => ImageUserPutFileBloc(
      imageUserPutFileUseCase: sl.call(), authListenBloc: sl.call()));
  sl.registerFactory(() => UpdateUserBloc(updateUserUseCase: sl.call()));
  sl.registerFactory(() => SignOutBloc(authSignOutUseCase: sl.call()));
  sl.registerFactory(
      () => ForgetPasswordBloc(forgetPasswordUseCase: sl.call()));
  sl.registerFactory(() => LoginBloc(authLogInUseCase: sl.call()));
  sl.registerFactory(() => CreateUserBloc(createUserUseCase: sl.call()));
  sl.registerFactory(() => SignUpBloc(
        userBloc: sl.call(),
        authSignUpUseCase: sl.call(),
      ));
  sl.registerFactory(() =>
      AuthListenBloc(authGetUserUseCase: sl.call(), getUserUseCase: sl.call()));
  sl.registerFactory(
      () => GetProductsOfCategoryBloc(getProductsUseCase: sl.call()));
  sl.registerFactory(() => CartBloc(cartLocalDataSourceImpl: sl.call()));
  sl.registerFactory(
      () => FavoriteBloc(favoriteLocalDataSourceImpl: sl.call()));
  sl.registerFactory(() => AppThemeBloc(themeLocalDataSourceImpl: sl.call()));
  sl.registerFactory(() => GetCategoryBloc(getCategoryUseCases: sl.call()));
  sl.registerFactory(
      () => AllProductsBloc(getProductOfCategoryUseCase: sl.call()));
  sl.registerFactory(() => StatusInternetBloc());
  sl.registerFactory(() => AppLocaleBloc(localeLocalDataSourceImpl: sl.call()));
  //! Data Sources
  sl.registerLazySingleton(
      () => AuthGoogleSignInRemoteDataSourceImpl(firebaseAuth: sl.call()));
  sl.registerLazySingleton(
      () => AuthDeleteAccountRemoteDataSourceImpl(firebaseAuth: sl.call()));
  sl.registerLazySingleton(
      () => DeleteUserRemoteDataSourceImpl(firebaseFirestore: sl.call()));
  sl.registerLazySingleton(
      () => ImageUserPutFileRemoteDataSourceImpl(firebaseStorage: sl.call()));
  sl.registerLazySingleton(
      () => UpdateUserRemoteDataSourceImpl(firebaseFirestore: sl.call()));
  sl.registerLazySingleton(
      () => AuthSignOutRemoteDataSourceImpl(firebaseAuth: sl.call()));
  sl.registerLazySingleton(
      () => AuthForgetPasswordRemoteDataSourceImpl(firebaseAuth: sl.call()));
  sl.registerLazySingleton(
      () => AuthLogInRemoteDataSourceImpl(firebaseAuth: sl.call()));
  sl.registerLazySingleton(
      () => CreateUserRemoteDataSourceImpl(firebaseFirestore: sl.call()));
  sl.registerLazySingleton(
      () => AuthSignUpRemoteDataSourceImpl(firebaseAuth: sl.call()));
  sl.registerLazySingleton(
      () => GetUserRemoteDataSourceImpl(firebaseFirestore: sl.call()));
  sl.registerLazySingleton<AuthGetUserRemoteDataSource>(
      () => AuthGetUserRemoteDataSourceImpl(firebaseAuth: sl.call()));
  sl.registerLazySingleton(() => GetProductsOfCategoryLocalDataSourceImpl());
  sl.registerLazySingleton(() => GetProductsOfCategoryRemoteDataSourceImpl(
      apiService: sl.call(), gerProductsLocal: sl.call()));
  sl.registerLazySingleton(() => CartLocalDataSourceImpl());
  sl.registerLazySingleton(() => FavoriteLocalDataSourceImpl());
  sl.registerLazySingleton(() => LocaleLocalDataSourceImpl());
  sl.registerLazySingleton(() => ThemeLocalDataSourceImpl());
  sl.registerLazySingleton(() => AllProductsLocalDataSourceImpl());
  sl.registerLazySingleton(() => CategoryLocalDataSourceImpl());
  sl.registerLazySingleton<CategoryRemoteDataSourceImpl>(
      () => CategoryRemoteDataSourceImpl(
            categoryLocalDataSourceImpl: sl.call(),
            apiService: sl.call(),
          ));
  sl.registerLazySingleton<AllProductsRemoteDataSourceImpl>(() =>
      AllProductsRemoteDataSourceImpl(
          apiService: sl.call(), productsLocalDataSourceImpl: sl.call()));

  //! Repository
  sl.registerLazySingleton<AuthGoogleSignInRepo>(
    () => AuthGoogleSignInRepoImpl(
        authGoogleSignInRemoteDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<AuthDeleteAccountRepo>(
    () => AuthDeleteAccountRepoImpl(
        authDeleteAccountRemoteDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<DeleteUserRepo>(
    () => DeleteUserRepoImpl(deleteUserRemoteDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<ImageUserPutFileRepo>(
    () => ImageUserPutFileRepoImpl(
        imageUserPutFileRemoteDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<UpdateUserRepo>(
    () => UpdateUserRepoImpl(updateUserRemoteDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<AuthSignOutUserRepo>(
    () => AuthSignOutUserRepoImpl(authSignOutRemoteDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<AuthForgetPasswordRepo>(
    () => AuthForgetPasswordRepoImpl(
        forgetPasswordRemoteDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<AuthLoginUserRepo>(
    () => AuthLoginUserRepoImpl(authLogInRemoteDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<CreateUserRepo>(
    () => CreateUserRepoImpl(createUserRemoteDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<AuthSignUpUserRepo>(
    () => AuthSignUpUserRepoImpl(authSignUpRemoteDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<AuthGetUserRepo>(
    () => AuthGetUserRepoImpl(authGetUserRemoteDataSource: sl.call()),
  );
  sl.registerLazySingleton<GetUserRepo>(
    () => GetUserRepoImpl(getUserRemoteDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<GetProductsOfCategoryRepo>(
    () => GetProductsOfCategoryRepoImpl(
        getProductsLocal: sl.call(), getProductsRemote: sl.call()),
  );
  sl.registerLazySingleton<CategoryRepo>(
    () => CategoryRepoImpl(
        categoryRemoteDataSourceImpl: sl.call(),
        categoryLocalDataSourceImpl: sl.call()),
  );
  sl.registerLazySingleton<AllProductsRepo>(
    () => GetAllProductsRepoImpl(
        productsLocalDataSourceImpl: sl.call(),
        productOfCategoryRemoteDataSourceImpl: sl.call()),
  );

  //! Use Cases
  sl.registerLazySingleton(
      () => AuthGoogleSignInUseCase(authSignInGoogleRepo: sl.call()));
  sl.registerLazySingleton(
      () => AuthDeleteAccountUseCase(authDeleteAccountRepo: sl.call()));
  sl.registerLazySingleton(() => DeleteUserUseCase(deleteUserRepo: sl.call()));
  sl.registerLazySingleton(
      () => ImageUserPutFileUseCase(imageUserPutFileRepo: sl.call()));
  sl.registerLazySingleton(() => UpdateUserUseCase(updateUserRepo: sl.call()));
  sl.registerLazySingleton(
      () => AuthSignOutUseCase(signOutUserRepo: sl.call()));
  sl.registerLazySingleton(
      () => AuthForgetPasswordUseCase(authForgetPasswordRepo: sl.call()));
  sl.registerLazySingleton(() => AuthLogInUseCase(loginUserRepo: sl.call()));
  sl.registerLazySingleton(() => CreateUserUseCase(createUserRepo: sl.call()));
  sl.registerLazySingleton(() => AuthSignUpUseCase(signUpUserRepo: sl.call()));
  sl.registerLazySingleton(() => GetUserUseCase(getUserRepo: sl.call()));
  sl.registerLazySingleton(
      () => AuthGetUserUseCase(authGetUserRepo: sl.call()));
  sl.registerLazySingleton(
      () => GetProductsOfCategoryUseCase(getProductsOfCategoryRepo: sl.call()));
  sl.registerLazySingleton(
      () => GetCategoryUseCases(getCategoryRepo: sl.call()));
  sl.registerLazySingleton(
      () => AllProductsUseCase(getProductsOfCategoryRepo: sl.call()));

  //! Core
  sl.registerLazySingleton<ApiService>(() => ApiService(sl.call()));

  //! External
  sl.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<Dio>(() => Dio());
}
