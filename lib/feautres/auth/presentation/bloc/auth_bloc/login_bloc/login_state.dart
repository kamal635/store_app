part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoaing extends LoginState {}

final class LoginSuccess extends LoginState {
  final String email;
  final String password;
  final auth.User? authUser;

  const LoginSuccess({
    required this.authUser,
    required this.email,
    required this.password,
  });
}

final class LoginFailure extends LoginState {
  final String errorAuth;

  const LoginFailure({required this.errorAuth});
  @override
  List<Object> get props => [errorAuth];
}

class LoginEmailFailure extends LoginState {
  final String errorEmail;

  const LoginEmailFailure({required this.errorEmail});
  @override
  List<Object> get props => [errorEmail];
}

class LoginPasswordFailure extends LoginState {
  final String errorPassword;

  const LoginPasswordFailure({required this.errorPassword});
  @override
  List<Object> get props => [errorPassword];
}

class ObscureTextLoginState extends LoginState {
  final bool obscureText;

  const ObscureTextLoginState({required this.obscureText});

  @override
  List<Object> get props => [obscureText];
}
