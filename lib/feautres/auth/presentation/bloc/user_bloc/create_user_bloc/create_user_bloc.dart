import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/user.dart';
import '../../../../domain/use_cases/user_use_case/create_user_use_case.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  final CreateUserUseCase createUserUseCase;

  CreateUserBloc({
    required this.createUserUseCase,
  }) : super(CreateUserLoding()) {
    on<CreateUserEvent>((event, emit) async {
      //this event add when sign up success (add in signup bloc)
      if (event is CreateUserChangedEvent) {
        emit(CreateUserLoding());
        final createUser = await createUserUseCase.call(event.userModel);
        createUser.fold((l) {
          emit(CreateUserFailure(errorMessage: l.message));
        }, (r) {
          emit(CreateUserSuccess());
        });
      }
    });
  }
}
