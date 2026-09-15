import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queens/widgets/common.dart';
import 'package:queens/controllers/score_controller.dart';
import 'package:queens/config/constants.dart';
import 'package:queens/widgets/statistic.dart';
import 'package:queens/config/level_data.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  int calculatePercentage(int correct, int total) {
    if (total == 0) return 0;
    return ((correct / total) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    final scoreController = Get.find<ScoreController>();
    double width = MediaQuery.of(context).size.width;
    double aspectRatio = width < Breakpoints.sb ? 3.0 : 1.5;
    int count = width < Breakpoints.sb
        ? 1
        : width < Breakpoints.md
        ? 2
        : 3;

    return GameScaffold(
      child: Column(
        spacing: Spacing.medium,
        children: [
          GameText("Statistics", size: FontSize.subtitle),
          GameButton(text: "Back", onPressed: () => Get.back()),
          Expanded(
            child: Center(
              child: GridView.count(
                crossAxisCount: count,
                childAspectRatio: aspectRatio,
                padding: EdgeInsets.all(10),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  Statistic("Levels available", "${gameLevels.length}"),
                  Obx(
                    () => Statistic(
                      "Total plays",
                      "${scoreController.totalPlays}",
                    ),
                  ),
                  Obx(
                    () => Statistic(
                      "Total play time",
                      "${scoreController.totalPlayTime.toStringAsFixed(2)}s",
                    ),
                  ),
                  Obx(
                    () => Statistic(
                      "Average time per level",
                      "${scoreController.averageTime.toStringAsFixed(2)}s",
                    ),
                  ),
                  Obx(
                    () => Statistic(
                      "Fastest time",
                      "${scoreController.fastestTime.toStringAsFixed(2)}s",
                    ),
                  ),
                  Obx(
                    () => Statistic(
                      "Slowest time",
                      "${scoreController.slowestTime.toStringAsFixed(2)}s",
                    ),
                  ),
                  Obx(
                    () => Statistic(
                      "Levels completed",
                      "${scoreController.completedLevels.length}",
                    ),
                  ),
                  Obx(
                    () => Statistic(
                      "Levels not completed",
                      "${gameLevels.length - scoreController.completedLevels.length}",
                    ),
                  ),
                  Obx(
                    () => Statistic(
                      "Percentage completed",
                      "${calculatePercentage(scoreController.completedLevels.length, gameLevels.length)}%",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
