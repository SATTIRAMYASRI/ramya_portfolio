part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitialState extends ThemeState {}

class ThemeChangedState extends ThemeState {
  final ThemeData themeColor;
  ThemeChangedState(this.themeColor);

  List<Object> get props => [themeColor];
}
