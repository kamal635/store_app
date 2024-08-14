part of 'delete_account_bloc.dart';

sealed class DeleteAccountState extends Equatable {
  const DeleteAccountState();

  @override
  List<Object> get props => [];
}

final class DeleteAccountInitial extends DeleteAccountState {}

final class DeleteAccountLoading extends DeleteAccountState {}

final class DeleteAccountSuccess extends DeleteAccountState {}

final class DeleteAccountFailure extends DeleteAccountState {
  final String errorMessage;

  const DeleteAccountFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
