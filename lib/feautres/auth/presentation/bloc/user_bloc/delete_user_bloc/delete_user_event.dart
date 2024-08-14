part of 'delete_user_bloc.dart';

sealed class DeleteUserEvent extends Equatable {
  const DeleteUserEvent();

  @override
  List<Object> get props => [];
}

class DeleteUserTappedEvent extends DeleteUserEvent {}
