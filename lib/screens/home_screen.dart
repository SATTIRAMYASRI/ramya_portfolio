import 'package:flutter/material.dart';
import 'package:ramya_portfolio/widgets/side_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SideBar(),
        Column(
          children: [
            Row(
              children: [Text("social media links"), Text("light dark")],
            ),
            Row(
              children: [Text("changing role text"), Text("lottie")],
            )
          ],
        )
      ],
    );
  }
}
