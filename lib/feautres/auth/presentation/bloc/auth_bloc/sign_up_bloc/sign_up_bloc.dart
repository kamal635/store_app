import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/utils/failure.dart';
import '../../../../data/models/user.dart';
import '../../../../domain/use_cases/auth_use_case/auth_sign_up_use_case.dart';
import '../../user_bloc/create_user_bloc/create_user_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthSignUpUseCase authSignUpUseCase;
  final CreateUserBloc userBloc;
  String email = "";
  String password = "";
  String confirmPassword = "";

  SignUpBloc({required this.authSignUpUseCase, required this.userBloc})
      : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      //=================== email changed event =================
      if (event is SignUpEmailChangedEvent) {
        email = event.email;
      }

      //=================== password changed event =================
      if (event is SignUpPasswordChangedEvent) {
        password = event.password;
      }

      //=================== confirm Password changed event =================
      if (event is SignUpConfirmPasswordChangedEvent) {
        confirmPassword = event.confirmPassword;
      }

      //=================== sign up event =================
      if (event is SignUpAuthEvent) {
        emit(SignUpLoading());
        //=============== check email or password empty and confirm password match ==========

        if (email.isEmpty) {
          return emit(const SignUpEmailFailure(
              errorEmail: "Email or password is empty"));
        }

        if (password.isEmpty) {
          return emit(const SignUpPasswordFailure(
              errorPassword: "Email or password is empty"));
        }
        if (password != confirmPassword) {
          return emit(const SignUpConfirmPasswordFailure(
              errorConfirmPassword: "No match in password"));
        }

        //======================= method sign up form use case ==============
        final signUp = await authSignUpUseCase.call(email, password);

        //======================= Either fold to return left failure or right User? ==============
        signUp.fold((l) {
          if (l is EmailAuthFailure) {
            return emit(SignUpEmailFailure(errorEmail: l.message));
          }
          if (l is PasswordAuthFailure) {
            return emit(SignUpPasswordFailure(errorPassword: l.message));
          }
          if (l is FirebaseAuthFailure) {
            return emit(SignUpFailure(errorAuth: l.message));
          }
        }, (r) {
          UserModel userModel = UserModel(id: r!.uid, email: email);
          userBloc.add(CreateUserChangedEvent(userModel: userModel));
          return emit(SignUpSuccess(
              authUser: r,
              email: email,
              password: password,
              rePassword: confirmPassword));
        });
      }
    });
  }
}
