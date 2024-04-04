part of 'side_nav_bar_cubit.dart';

@immutable
sealed class SideNavBarState {}

final class SideNavBarInitial extends SideNavBarState {
}

final class UpdateSideNavBarIcon extends SideNavBarState {
  final SideNavBarIconsEnum updatedIcon;
  UpdateSideNavBarIcon(this.updatedIcon);

  List<Object> get props => [updatedIcon];
}
