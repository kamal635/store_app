import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/feautres/auth/data/models/user.dart';
import 'package:store_app/feautres/auth/domain/use_cases/user_use_case/update_user_use_case.dart';
part 'update_user_event.dart';
part 'update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  final UpdateUserUseCase updateUserUseCase;
  String? fullName;
  String? address;
  String? city;
  String? country;
  String? email;
  String? zipCode;
  UpdateUserBloc({required this.updateUserUseCase})
      : super(UpdateUserInitial()) {
    on<UpdateUserEvent>((event, emit) async {
      if (event is FullNameEvent) {
        fullName = event.fullName;
      }
      if (event is AddressEvent) {
        address = event.address;
      }
      if (event is CityEvent) {
        city = event.city;
      }
      if (event is CountryEvent) {
        country = event.country;
      }
      if (event is ZipCodeEvent) {
        zipCode = event.zipCode;
      }
      //================ update event ================
      if (event is UpdateTappedUserEvent) {
        emit(UpdateUserLoading());
        UserModel userModel = UserModel(
          id: event.userModel.id,
          fullName: fullName ?? event.userModel.fullName,
          address: address ?? event.userModel.address,
          city: city ?? event.userModel.city,
          country: country ?? event.userModel.country,
          email: email ?? event.userModel.email,
          zipCode: zipCode ?? event.userModel.zipCode,
        );
        final update = await updateUserUseCase.call(userModel);
        update.fold((l) => emit(UpdateUserFailure(errorMessage: l.message)),
            (_) => emit(UpdateUserSuccess()));
      }
    });
  }
}
