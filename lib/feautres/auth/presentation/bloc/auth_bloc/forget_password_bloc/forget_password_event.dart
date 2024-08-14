part of 'forget_password_bloc.dart';

sealed class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgetPasswrodTappedEvent extends ForgetPasswordEvent {}

class ForgetPasswrodChangedEmailEvent extends ForgetPasswordEvent {
  final String email;

  const ForgetPasswrodChangedEmailEvent({required this.email});
  @override
  List<Object> get props => [email];
}
