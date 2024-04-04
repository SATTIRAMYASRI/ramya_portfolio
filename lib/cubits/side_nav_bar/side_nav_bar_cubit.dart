import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:ramya_portfolio/enums/side_nav_bar_enums.dart';

part 'side_nav_bar_state.dart';

class SideNavBarCubit extends Cubit<SideNavBarState> {
  SideNavBarIconsEnum selectedIcon = SideNavBarIconsEnum.person;
  SideNavBarCubit() : super(SideNavBarInitial());

  void updateSelectedIcon(SideNavBarIconsEnum updatedIcon) {
    selectedIcon = updatedIcon;
    emit(UpdateSideNavBarIcon(updatedIcon));
  }
}
