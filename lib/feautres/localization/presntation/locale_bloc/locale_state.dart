part of 'locale_bloc.dart';

sealed class AppLocaleState extends Equatable {
  const AppLocaleState();

  @override
  List<Object> get props => [];
}

class LocaleInitial extends AppLocaleState {}

class ChangeLocaleState extends AppLocaleState {
  final Locale locale;

  const ChangeLocaleState({required this.locale});
  @override
  List<Object> get props => [locale];
}
