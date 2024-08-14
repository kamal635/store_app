part of 'google_sign_in_bloc.dart';

sealed class GoogleSignInState extends Equatable {
  const GoogleSignInState();

  @override
  List<Object> get props => [];
}

final class GoogleSignInInitial extends GoogleSignInState {}

final class GoogleSignInILoading extends GoogleSignInState {}

final class GoogleSignInSuccess extends GoogleSignInState {
  final UserCredential userCredential;

  const GoogleSignInSuccess({required this.userCredential});
  @override
  List<Object> get props => [userCredential];
}

final class GoogleSignInFailure extends GoogleSignInState {
  final String errorMessage;

  const GoogleSignInFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
