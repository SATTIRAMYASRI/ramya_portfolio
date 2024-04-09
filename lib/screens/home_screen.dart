import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramya_portfolio/cubits/side_nav_bar/side_nav_bar_cubit.dart';
import 'package:ramya_portfolio/cubits/theme/theme_cubit.dart';
import 'package:ramya_portfolio/enums/side_nav_bar_enums.dart';
import 'package:ramya_portfolio/widgets/side_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeCubit _themeCubit;
  late SideNavBarCubit _sideNavBarCubit;

  @override
  void initState() {
    _themeCubit = context.read<ThemeCubit>();
    _sideNavBarCubit = SideNavBarCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _sideNavBarCubit,
      child: BlocBuilder<SideNavBarCubit, SideNavBarState>(
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocProvider(
                create: (context) => _themeCubit,
                child: const SideBar(),
              ),
              selectRoute()
            ],
          );
        },
      ),
    );
  }

  Widget selectRoute() {
    debugPrint('${_sideNavBarCubit.selectedIcon}');
    switch (_sideNavBarCubit.selectedIcon) {
      case SideNavBarIconsEnum.person:
        return Text("person");
      case SideNavBarIconsEnum.work:
        return Text("work");
      case SideNavBarIconsEnum.lightbulb:
        return Text("lightbulb");
      case SideNavBarIconsEnum.code:
        return Text("code");
      case SideNavBarIconsEnum.ratereview:
        return Text("ratereview");
      case SideNavBarIconsEnum.mail:
        return Text("mail");
      default:
        return Text("default");
    }
  }
}
