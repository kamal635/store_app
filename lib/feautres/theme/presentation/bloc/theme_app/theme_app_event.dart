part of 'theme_app_bloc.dart';

sealed class ThemeAppEvent extends Equatable {
  const ThemeAppEvent();

  @override
  List<Object> get props => [];
}

class CurrentThemeEvent extends ThemeAppEvent {}

class ChangeThemeEvent extends ThemeAppEvent {
  final AppTheme changeTheme;

  const ChangeThemeEvent({required this.changeTheme});
  @override
  List<Object> get props => [changeTheme];
}
