import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/utils/failure.dart';
import '../../../../domain/use_cases/auth_use_case/auth_login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthLogInUseCase authLogInUseCase;

  String email = "";
  String password = "";

  LoginBloc({required this.authLogInUseCase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      //=================== obscureText event =================
      if (event is ObscureTextLoginEvent) {
        emit(ObscureTextLoginState(obscureText: event.obscureText));
      }
      //=================== email changed event =================
      if (event is LoginEmailChangedEvent) {
        email = event.email;
      }

      //=================== password changed event =================
      if (event is LoginPasswordChangedEvent) {
        password = event.password;
      }

      //=================== login event =================
      if (event is LoginAuthEvent) {
        emit(LoginLoaing());
        //=============== check email or password empty ==========
        if (email.isEmpty) {
          return emit(const LoginEmailFailure(
              errorEmail: "Email or password is empty"));
        }
        if (password.isEmpty) {
          return emit(const LoginPasswordFailure(
              errorPassword: "Email or password is empty"));
        }

        //======================= method login form use case ==============
        final login = await authLogInUseCase.call(email, password);

        //======================= Either fold to return left failure or right Unit==============
        login.fold((l) {
          if (l is EmailAuthFailure) {
            return emit(LoginEmailFailure(errorEmail: l.message));
          }
          if (l is PasswordAuthFailure) {
            return emit(LoginPasswordFailure(errorPassword: l.message));
          }
          if (l is FirebaseAuthFailure) {
            return emit(LoginFailure(errorAuth: l.message));
          }
        }, (r) {
          emit(LoginSuccess(authUser: r, email: email, password: password));
        });
      }
    });
  }
}
