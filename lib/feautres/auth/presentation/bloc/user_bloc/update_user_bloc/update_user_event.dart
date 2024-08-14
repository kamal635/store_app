part of 'update_user_bloc.dart';

sealed class UpdateUserEvent extends Equatable {
  const UpdateUserEvent();

  @override
  List<Object?> get props => [];
}

class UpdateTappedUserEvent extends UpdateUserEvent {
  final UserModel userModel;

  const UpdateTappedUserEvent({required this.userModel});
  @override
  List<Object?> get props => [userModel];
}

class FullNameEvent extends UpdateUserEvent {
  final String fullName;

  const FullNameEvent({
    required this.fullName,
  });
  @override
  List<Object?> get props => [fullName];
}

class AddressEvent extends UpdateUserEvent {
  final String address;

  const AddressEvent({
    required this.address,
  });
  @override
  List<Object?> get props => [address];
}

class CountryEvent extends UpdateUserEvent {
  final String country;

  const CountryEvent({
    required this.country,
  });
  @override
  List<Object?> get props => [country];
}

class CityEvent extends UpdateUserEvent {
  final String city;

  const CityEvent({
    required this.city,
  });
  @override
  List<Object?> get props => [city];
}

class ZipCodeEvent extends UpdateUserEvent {
  final String zipCode;

  const ZipCodeEvent({
    required this.zipCode,
  });
  @override
  List<Object?> get props => [zipCode];
}
