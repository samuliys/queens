import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queens/widgets/common.dart';
import 'package:queens/controllers/score_controller.dart';
import 'package:queens/config/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scoreController = Get.find<ScoreController>();

    return GameScaffold(
      child: Column(
        spacing: Spacing.medium,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GameText("Settings", size: FontSize.subtitle),
          GameButton(
            text: "Reset Scores",
            onPressed: () => scoreController.reset(),
            color: Colors.red,
          ),
          GameButton(text: "Back", onPressed: () => Get.back()),
        ],
      ),
    );
  }
}
