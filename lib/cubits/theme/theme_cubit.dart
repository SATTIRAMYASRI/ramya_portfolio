import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ramya_portfolio/Theme/themes.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitialState());
  ThemeData themeColor = darkMode;

  changeTheme(selectedMode) {
    themeColor = selectedMode;
    emit(ThemeChangedState(themeColor));
  }
}
