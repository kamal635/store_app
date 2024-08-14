part of 'create_user_bloc.dart';

sealed class CreateUserEvent extends Equatable {
  const CreateUserEvent();

  @override
  List<Object?> get props => [];
}

class CreateUserChangedEvent extends CreateUserEvent {
  final UserModel userModel;

  const CreateUserChangedEvent({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}
