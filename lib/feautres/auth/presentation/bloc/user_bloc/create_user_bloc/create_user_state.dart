part of 'create_user_bloc.dart';

sealed class CreateUserState extends Equatable {
  const CreateUserState();

  @override
  List<Object?> get props => [];
}

class CreateUserLoding extends CreateUserState {}

class CreateUserSuccess extends CreateUserState {}

class CreateUserFailure extends CreateUserState {
  final String errorMessage;

  const CreateUserFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
