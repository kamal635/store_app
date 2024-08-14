import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/utils/failure.dart';
import '../../../../domain/use_cases/auth_use_case/auth_forget_password_use_case.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final AuthForgetPasswordUseCase forgetPasswordUseCase;
  String email = "";
  ForgetPasswordBloc({required this.forgetPasswordUseCase})
      : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>((event, emit) async {
      //=================== email changed event =================
      if (event is ForgetPasswrodChangedEmailEvent) {
        email = event.email;
      }
      //=================== forget password event =================
      if (event is ForgetPasswrodTappedEvent) {
        emit(ForgetPasswordLoading());
        if (email.isEmpty) {
          return emit(const ForgetPasswordEmailFailure(
              errorEmail: "Email or password is empty"));
        }
        final forgetPassword = await forgetPasswordUseCase.call(email);
        forgetPassword.fold((l) {
          if (l is EmailAuthFailure) {
            return emit(ForgetPasswordEmailFailure(errorEmail: l.message));
          }
          if (l is FirebaseAuthFailure) {
            return emit(ForgetPasswordFailure(errorMessage: l.message));
          }
        }, (_) {
          return emit(ForgetPasswordSuccess());
        });
      }
    });
  }
}
