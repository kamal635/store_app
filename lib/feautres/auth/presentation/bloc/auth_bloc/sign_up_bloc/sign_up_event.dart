part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpEmailChangedEvent extends SignUpEvent {
  final String email;

  const SignUpEmailChangedEvent({required this.email});
  @override
  List<Object> get props => [email];
}

class SignUpPasswordChangedEvent extends SignUpEvent {
  final String password;
  const SignUpPasswordChangedEvent({required this.password});
  @override
  List<Object> get props => [password];
}

class SignUpConfirmPasswordChangedEvent extends SignUpEvent {
  final String confirmPassword;
  const SignUpConfirmPasswordChangedEvent({required this.confirmPassword});
  @override
  List<Object> get props => [confirmPassword];
}

class SignUpAuthEvent extends SignUpEvent {}
