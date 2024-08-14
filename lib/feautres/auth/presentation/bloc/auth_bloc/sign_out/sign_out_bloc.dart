import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/use_cases/auth_use_case/auth_sign_out_use_case.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  final AuthSignOutUseCase authSignOutUseCase;
  SignOutBloc({required this.authSignOutUseCase}) : super(SignOutInitial()) {
    on<SignOutEvent>((event, emit) async {
      if (event is SignOutTappedEvent) {
        emit(SignOutLoaging());
        final signOut = await authSignOutUseCase.call();
        signOut.fold((l) => emit(SignOutFailure(errorMessage: l.message)),
            (r) => emit(SignOutSuccess()));
      }
    });
  }
}
