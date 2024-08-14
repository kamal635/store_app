part of 'auth_listen_bloc.dart';

sealed class AuthListenEvent extends Equatable {
  const AuthListenEvent();

  @override
  List<Object?> get props => [];
}

class AuthUserChanged extends AuthListenEvent {
  final auth.User? authUser;
  final UserModel? user;

  const AuthUserChanged({
    this.authUser,
    this.user,
  });
  @override
  List<Object?> get props => [authUser, user];
}
