part of 'auth_listen_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthListenState extends Equatable {
  final AuthStatus status;
  final auth.User? authUser;
  final UserModel? userModel;

  const AuthListenState._({
    this.status = AuthStatus.unauthenticated,
    this.authUser,
    this.userModel,
  });

  const AuthListenState.authenticated({
    required auth.User authUser,
    required UserModel userModel,
  }) : this._(
          status: AuthStatus.authenticated,
          authUser: authUser,
          userModel: userModel,
        );

  const AuthListenState.unauthenticated() : this._();

  @override
  List<Object?> get props => [status, userModel];
}
