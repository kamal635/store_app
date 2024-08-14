part of 'locale_bloc.dart';

sealed class AppLocalEvent extends Equatable {
  const AppLocalEvent();

  @override
  List<Object> get props => [];
}

class CurrentLocaleEvent extends AppLocalEvent {}

class ChangeLocaleEvent extends AppLocalEvent {
  final AppLocale appLanguage;

  const ChangeLocaleEvent({required this.appLanguage});
  @override
  List<Object> get props => [appLanguage];
}
