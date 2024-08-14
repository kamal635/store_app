import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/feautres/auth/domain/use_cases/user_use_case/delete_user_use_case.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_bloc/delete_account_bloc/delete_account_bloc.dart';

import 'package:store_app/feautres/auth/presentation/bloc/auth_listen_bloc/auth_listen_bloc.dart';

part 'delete_user_event.dart';
part 'delete_user_state.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  final DeleteUserUseCase deleteUserUseCase;
  final AuthListenBloc authListenBloc;
  final DeleteAccountBloc deleteAccountBloc;
  StreamSubscription? streamDeleteAccount;
  DeleteUserBloc({
    required this.deleteAccountBloc,
    required this.deleteUserUseCase,
    required this.authListenBloc,
  }) : super(DeleteUserInitial()) {
    streamDeleteAccount = deleteAccountBloc.stream.listen((state) {
      if (state is DeleteAccountSuccess) {
        add(DeleteUserTappedEvent());
      }
    });
    on<DeleteUserEvent>((event, emit) async {
      if (event is DeleteUserTappedEvent) {
        emit(DeleteUserLoading());
        final deleteUser = await deleteUserUseCase
            .deleteUser(authListenBloc.state.userModel!.id!);
        deleteUser.fold((l) => emit(DeleteUserFailure(errorMessage: l.message)),
            (_) => emit(DeleteUserSuccess()));
      }
    });
  }
  @override
  Future<void> close() async {
    streamDeleteAccount!.cancel();
    super.close();
  }
}
