import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramya_portfolio/Theme/themes.dart';
import 'package:ramya_portfolio/constants/edge_insets.dart';
import 'package:ramya_portfolio/cubits/side_nav_bar/side_nav_bar_cubit.dart';
import 'package:ramya_portfolio/cubits/theme/theme_cubit.dart';
import 'package:ramya_portfolio/enums/side_nav_bar_enums.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late ThemeCubit _themeCubit;
  late SideNavBarCubit _sideNavBarCubit;

  @override
  void initState() {
    _themeCubit = ThemeCubit();
    _sideNavBarCubit = SideNavBarCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SideNavBarCubit>(
          create: (context) => _sideNavBarCubit,
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => _themeCubit,
        ),
      ],
      child: BlocBuilder<SideNavBarCubit, SideNavBarState>(
          builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(ConstEdgeInsets.eight),
          decoration: BoxDecoration(
              color: _themeCubit.themeColor.colorScheme.primaryContainer,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              iconButton(
                toolTip: "Intro",
                iconName: SideNavBarIconsEnum.person,
                icon: Icons.person,
              ),
              iconButton(
                toolTip: "Experience",
                iconName: SideNavBarIconsEnum.work,
                icon: Icons.work,
              ),
              iconButton(
                toolTip: "Skills",
                iconName: SideNavBarIconsEnum.lightbulb,
                icon: Icons.lightbulb,
              ),
              iconButton(
                toolTip: "Projects",
                iconName: SideNavBarIconsEnum.code,
                icon: Icons.code,
              ),
              iconButton(
                toolTip: "Recommendations",
                iconName: SideNavBarIconsEnum.ratereview,
                icon: Icons.rate_review,
              ),
              iconButton(
                toolTip: "Contact",
                iconName: SideNavBarIconsEnum.mail,
                icon: Icons.mail,
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget iconButton({toolTip, iconName, isSelected, icon, onTap}) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: _sideNavBarCubit.selectedIcon == iconName
              ? _themeCubit.themeColor.colorScheme.onPrimaryContainer
              : null,
          borderRadius: BorderRadius.circular(ConstEdgeInsets.eight)),
      child: IconButton(
        tooltip: toolTip,
        icon: Icon(icon, size: 30),
        onPressed: () {
          _sideNavBarCubit.updateSelectedIcon(iconName);
        },
        color: _sideNavBarCubit.selectedIcon == iconName
            ? _themeCubit.themeColor.colorScheme.onPrimary
            : _themeCubit.themeColor.colorScheme.onPrimaryContainer,
      ),
    );
  }
}

Widget selectedScreen() {
  return Text("Hello");
}
