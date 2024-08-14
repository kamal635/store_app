import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_app/feautres/auth/domain/use_cases/auth_use_case/auth_google_sign_in_use_case.dart';

part 'google_sign_in_event.dart';
part 'google_sign_in_state.dart';

class GoogleSignInBloc extends Bloc<GoogleSignInEvent, GoogleSignInState> {
  final AuthGoogleSignInUseCase authGoogleSignInUseCase;
  GoogleSignInBloc({required this.authGoogleSignInUseCase})
      : super(GoogleSignInInitial()) {
    on<GoogleSignInEvent>((event, emit) async {
      if (event is GoogleSignInTappedEvent) {
        emit(GoogleSignInILoading());
        final cred = await authGoogleSignInUseCase.googleSignIn();
        cred.fold((l) => emit(GoogleSignInFailure(errorMessage: l.message)),
            (r) => emit(GoogleSignInSuccess(userCredential: r)));
      }
    });
  }
}
