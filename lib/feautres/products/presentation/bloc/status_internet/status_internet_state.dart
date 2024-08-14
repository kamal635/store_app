part of 'status_internet_bloc.dart';

sealed class StatusInternetState extends Equatable {
  const StatusInternetState();

  @override
  List<Object> get props => [];
}

final class StatusInternetInitial extends StatusInternetState {}

final class StatusInternetOffline extends StatusInternetState {
  final String message;

  const StatusInternetOffline({required this.message});
  @override
  List<Object> get props => [message];
}

final class StatusInternetOnline extends StatusInternetState {
  final String message;
  const StatusInternetOnline({required this.message});
  @override
  List<Object> get props => [message];
}
