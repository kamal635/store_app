import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/feautres/auth/domain/use_cases/auth_use_case/auth_delete_account_user_case.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  final AuthDeleteAccountUseCase authDeleteAccountUseCase;

  DeleteAccountBloc({required this.authDeleteAccountUseCase})
      : super(DeleteAccountInitial()) {
    on<DeleteAccountEvent>((event, emit) async {
      if (event is DeleteAccountTappedEvent) {
        emit(DeleteAccountLoading());
        final deleteAccount = await authDeleteAccountUseCase.deleteAccount();
        deleteAccount.fold(
            (l) => emit(DeleteAccountFailure(errorMessage: l.message)), (_) {
          return emit(DeleteAccountSuccess());
        });
      }
    });
  }
}
