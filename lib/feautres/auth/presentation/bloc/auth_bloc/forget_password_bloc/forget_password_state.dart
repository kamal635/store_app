part of 'forget_password_bloc.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errorMessage;

  const ForgetPasswordFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class ForgetPasswordEmailFailure extends ForgetPasswordState {
  final String errorEmail;

  const ForgetPasswordEmailFailure({required this.errorEmail});
  @override
  List<Object> get props => [errorEmail];
}
