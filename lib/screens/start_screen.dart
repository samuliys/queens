import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queens/widgets/common.dart';
import 'package:queens/config/constants.dart';
import 'package:queens/screens/levels_screen.dart';
import 'package:queens/screens/howto_screen.dart';
import 'package:queens/screens/stats_screen.dart';
import 'package:queens/screens/settings_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Spacing.large,
        children: [
          GameText("Queens"),
          GameButton(
            text: "Play",
            primary: true,
            onPressed: () => Get.to(() => LevelScreen()),
          ),
          GameButton(
            text: "Instructions",
            onPressed: () => Get.to(() => HowToPlayScreen()),
          ),
          GameButton(
            text: "Statistics",
            onPressed: () => Get.to(() => StatsScreen()),
          ),
          GameButton(
            text: "Settings",
            onPressed: () => Get.to(() => SettingsScreen()),
          ),
        ],
      ),
    );
  }
}
