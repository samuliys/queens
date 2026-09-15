import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queens/config/constants.dart';
import 'package:queens/screens/start_screen.dart';
import 'package:queens/widgets/common.dart';
import 'package:queens/widgets/level_list_view.dart';
import 'package:queens/widgets/level_stats_view.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isLarge = width >= Breakpoints.lg;

    return GameScaffold(
      child: Column(
        spacing: Spacing.medium,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GameText("Levels", size: FontSize.subtitle),
          GameButton(
            text: "Main Menu",
            onPressed: () => Get.to(() => StartScreen()),
          ),
          Expanded(
            child: isLarge
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [LevelStats(), Divider(), LevelList()],
                  )
                : Column(
                    children: [
                      LevelStats(),
                      Expanded(child: LevelList()),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
