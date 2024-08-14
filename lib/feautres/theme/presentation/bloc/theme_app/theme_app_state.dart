part of 'theme_app_bloc.dart';

sealed class AppThemeState extends Equatable {
  const AppThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeAppInitial extends AppThemeState {}

final class ChangedThemeState extends AppThemeState {
  final ThemeData changedTheme;

  const ChangedThemeState({required this.changedTheme});
  @override
  List<Object> get props => [changedTheme];
}
