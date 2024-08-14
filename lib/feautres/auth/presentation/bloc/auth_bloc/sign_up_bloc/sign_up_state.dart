// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final auth.User? authUser;
  final String email;
  final String password;
  final String rePassword;
  const SignUpSuccess({
    required this.authUser,
    required this.email,
    required this.password,
    required this.rePassword,
  });
  @override
  List<Object?> get props => [authUser];
}

class SignUpFailure extends SignUpState {
  final String errorAuth;

  const SignUpFailure({required this.errorAuth});
  @override
  List<Object?> get props => [errorAuth];
}

class SignUpPasswordFailure extends SignUpState {
  final String errorPassword;

  const SignUpPasswordFailure({required this.errorPassword});
  @override
  List<Object?> get props => [errorPassword];
}

class SignUpConfirmPasswordFailure extends SignUpState {
  final String errorConfirmPassword;

  const SignUpConfirmPasswordFailure({required this.errorConfirmPassword});
  @override
  List<Object?> get props => [errorConfirmPassword];
}

class SignUpEmailFailure extends SignUpState {
  final String errorEmail;

  const SignUpEmailFailure({required this.errorEmail});
  @override
  List<Object?> get props => [errorEmail];
}
