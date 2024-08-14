part of 'google_sign_in_bloc.dart';

sealed class GoogleSignInEvent extends Equatable {
  const GoogleSignInEvent();

  @override
  List<Object> get props => [];
}

class GoogleSignInTappedEvent extends GoogleSignInEvent {}
