import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramya_portfolio/Theme/themes.dart';
import 'package:ramya_portfolio/constants/image_constants.dart';
import 'package:ramya_portfolio/cubits/theme/theme_cubit.dart';
import 'package:ramya_portfolio/screens/home_screen.dart';
import 'package:ramya_portfolio/widgets/side_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeCubit _themeCubit;
  List<String> fruitsList = ["apple", "mango", "gova"];

  @override
  void initState() {
    _themeCubit = ThemeCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _themeCubit,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
            ],
            themeMode: _themeCubit.themeColor == lightMode
                ? ThemeMode.light
                : ThemeMode.dark,
            theme: lightMode,
            darkTheme: darkMode,
            home: Scaffold(
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Switch(
                    value: _themeCubit.themeColor == lightMode ? true : false,
                    onChanged: (value) {
                      _themeCubit.changeTheme(
                          _themeCubit.themeColor == lightMode
                              ? darkMode
                              : lightMode);
                    },
                    activeThumbImage: const AssetImage(ImageConstants.sun),
                    inactiveThumbImage: const AssetImage(ImageConstants.night),
                  ),
                  const SideBar()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
