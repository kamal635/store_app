part of 'status_internet_bloc.dart';

sealed class StatusInternetEvent extends Equatable {
  const StatusInternetEvent();

  @override
  List<Object> get props => [];
}

class OnlineEvent extends StatusInternetEvent {}

class OfflineEvent extends StatusInternetEvent {}
