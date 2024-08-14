import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'status_internet_event.dart';
part 'status_internet_state.dart';

class StatusInternetBloc
    extends Bloc<StatusInternetEvent, StatusInternetState> {
  StatusInternetBloc() : super(StatusInternetInitial()) {
    on<StatusInternetEvent>((event, emit) {
      //================== online event =========================
      if (event is OnlineEvent) {
        emit(const StatusInternetOnline(message: "internet is back"));
      }

      //================== offline event =========================
      if (event is OfflineEvent) {
        emit(const StatusInternetOffline(message: "No internet Connection"));
      }
    });

    var streamSubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(OnlineEvent());
      } else {
        add(OfflineEvent());
      }
    });

    @override
    Future<void> close() {
      streamSubscription.cancel();
      return super.close();
    }
  }
}
