part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChangedEvent extends LoginEvent {
  final String email;

  const LoginEmailChangedEvent({required this.email});
  @override
  List<Object> get props => [email];
}

class LoginPasswordChangedEvent extends LoginEvent {
  final String password;
  const LoginPasswordChangedEvent({required this.password});
  @override
  List<Object> get props => [password];
}

class LoginAuthEvent extends LoginEvent {}

class ObscureTextLoginEvent extends LoginEvent {
  final bool obscureText;

  const ObscureTextLoginEvent({required this.obscureText});
  @override
  List<Object> get props => [obscureText];
}
