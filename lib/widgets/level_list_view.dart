import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queens/screens/game_screen.dart';
import 'package:queens/widgets/common.dart';
import 'package:queens/config/constants.dart';
import 'package:queens/controllers/score_controller.dart';
import 'package:queens/config/level_data.dart';

class LevelList extends StatelessWidget {
  const LevelList({super.key});

  @override
  Widget build(BuildContext context) {
    final scoreController = Get.find<ScoreController>();
    return Obx(() {
      final levels = gameLevels.expand((level) {
        return [
          LevelCard(
            levelNum: level.id,
            completed: scoreController.completedLevels.contains(level.id),
            bestTime: scoreController.bestTimes[level.id],
            playCount: scoreController.playCounts[level.id] ?? 0,
            locked: level.id > scoreController.highestCompletedLevel + 1,
            isNextLevel: level.id == scoreController.highestCompletedLevel + 1,
            isNextLocked: level.id == scoreController.highestCompletedLevel + 2,
          ),
        ];
      }).toList();
      return SizedBox(
        width: Breakpoints.sb,
        child: ListView(children: levels),
      );
    });
  }
}

class LevelCard extends StatelessWidget {
  final int levelNum;
  final bool completed;
  final double? bestTime;
  final int playCount;
  final bool locked;
  final bool isNextLevel;
  final bool isNextLocked;

  const LevelCard({
    super.key,
    required this.levelNum,
    required this.completed,
    this.bestTime,
    this.playCount = 0,
    this.locked = false,
    this.isNextLevel = false,
    this.isNextLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isSmall = width < Breakpoints.sb;
    double titleSize = isSmall ? FontSize.body : FontSize.button;
    return Card(
      child: ListTile(
        title: GameText(
          'Level $levelNum',
          size: titleSize,
          align: TextAlign.left,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isNextLevel)
              Text(
                'Play Next',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (isNextLocked) ...[
              Text('Complete Level ${levelNum - 1} to unlock'),
              SizedBox(width: Spacing.small),
              Icon(Icons.lock, color: Colors.grey),
            ] else if (locked) ...[
              Icon(Icons.lock, color: Colors.grey),
            ] else if (completed) ...[
              Icon(Icons.check, color: Colors.green),
              SizedBox(width: Spacing.small),
              Text(
                'Plays: $playCount, best: ${bestTime!.toStringAsFixed(2)}s',
              ),
            ],
          ],
        ),
        onTap: locked
            ? null
            : () => Get.to(() => GameScreen(levelId: levelNum)),
      ),
    );
  }
}
