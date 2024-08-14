import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/feautres/auth/data/models/user.dart';
import '../../../domain/use_cases/auth_use_case/auth_get_user_use_case.dart';
import '../../../domain/use_cases/user_use_case/get_user_use_case.dart';

part 'auth_listen_event.dart';
part 'auth_listen_state.dart';

class AuthListenBloc extends Bloc<AuthListenEvent, AuthListenState> {
  StreamSubscription<auth.User?>? authUserSubscription;
  StreamSubscription<UserModel>? getUserSubscription;
  final AuthGetUserUseCase authGetUserUseCase;
  final GetUserUseCase getUserUseCase;
  AuthListenBloc(
      {required this.authGetUserUseCase, required this.getUserUseCase})
      : super(const AuthListenState.unauthenticated()) {
    authUserSubscription = authGetUserUseCase.call().listen((authUser) {
      print('Auth user: $authUser');
      if (authUser != null) {
        getUserUseCase.call(authUser.uid).listen((user) {
          add(AuthUserChanged(authUser: authUser, user: user));
        });
      } else {
        add(AuthUserChanged(authUser: authUser));
      }
    });

    on<AuthListenEvent>((event, emit) async {
      if (event is AuthUserChanged) {
        event.authUser != null
            ? emit(AuthListenState.authenticated(
                authUser: event.authUser!, userModel: event.user!))
            : emit(const AuthListenState.unauthenticated());
      }
    });

    @override
    Future<void> close() {
      authUserSubscription?.cancel();
      getUserSubscription?.cancel();
      return super.close();
    }
  }
}
