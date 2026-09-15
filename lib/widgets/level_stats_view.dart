import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queens/config/constants.dart';
import 'package:queens/config/level_data.dart';
import 'package:queens/controllers/score_controller.dart';

class LevelStats extends StatelessWidget {
  const LevelStats({super.key});

  @override
  Widget build(BuildContext context) {
    final scoreController = Get.find<ScoreController>();

    double width = MediaQuery.of(context).size.width;
    bool isLarge = width >= Breakpoints.lg;

    final statWidgets = [
      Obx(() {
        return LevelStat(
          "Next level",
          "Level ${scoreController.highestCompletedLevel + 1}",
          width,
        );
      }),
      Obx(() {
        return LevelStat(
          "Complete",
          "${scoreController.completedLevels.length} / ${gameLevels.length}",
          width,
        );
      }),
      Obx(() {
        return LevelStat(
          "Time played",
          "${scoreController.totalPlayTime.toStringAsFixed(2)}s",
          width,
        );
      }),
    ];

    if (scoreController.allLevelsCompleted) {
      statWidgets.removeAt(0);
    }

    return isLarge
        ? SizedBox(width: 200, child: Column(children: statWidgets))
        : Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: statWidgets.map((stat) => Expanded(child: stat)).toList(),
            ),
          );
  }
}

class LevelStat extends StatelessWidget {
  final String label;
  final String value;
  final double width;

  const LevelStat(this.label, this.value, this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isSmall = width < Breakpoints.sb;
    bool isLarge = width >= Breakpoints.lg;

    TextAlign align = isLarge ? TextAlign.left : TextAlign.center;
    double titleSize = isSmall ? FontSize.small : FontSize.button;
    double subtitleSize = isSmall ? FontSize.tiny : FontSize.body;
    return ListTile(
      dense: isSmall,
      horizontalTitleGap: isSmall ? 0 : null,
      title: Text(
        value,
        style: TextStyle(
          fontSize: titleSize,
          fontWeight: FontWeight.bold,
        ),
        textAlign: align,
      ),
      subtitle: Text(label.toUpperCase(), textAlign: align, style: TextStyle(fontSize: subtitleSize)),
    );
  }
}
