import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flame/game.dart';
import 'package:queens/config/level_data.dart';
import 'package:queens/config/constants.dart';
import 'package:queens/queens_game.dart';
import 'package:queens/widgets/common.dart';
import 'package:queens/screens/levels_screen.dart';
import 'package:queens/models/level.dart';

class GameScreen extends StatelessWidget {
  final int levelId;

  const GameScreen({super.key, required this.levelId});

  @override
  Widget build(BuildContext context) {
    Level level = gameLevels.firstWhere((l) => l.id == levelId);
    bool isLastLevel = levelId == gameLevels.last.id;

    return GameWidget(
      game: QueensGame(level: level),
      overlayBuilderMap: {
        'game': (context, game) {
          final gameRef = game as QueensGame;
          return GameOverlay(gameRef: gameRef, levelId: levelId);
        },
        'win': (context, game) {
          final gameRef = game as QueensGame;
          final formattedTime = gameRef.timer!.formatTime(
            gameRef.timer!.seconds,
          );
          return WinOverlay(
            levelId: levelId,
            formattedTime: formattedTime,
            isLastLevel: isLastLevel,
          );
        },
      },
      backgroundBuilder: (context) {
        return Container(color: Colors.white);
      },
      initialActiveOverlays: ['game'],
    );
  }
}

class GameOverlay extends StatelessWidget {
  final QueensGame gameRef;
  final int levelId;

  const GameOverlay({super.key, required this.gameRef, required this.levelId});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double verticalOffset = width < Breakpoints.sb ? 30 : 120;

    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: verticalOffset),
      child: Column(
        spacing: Spacing.medium,
        children: [
          GameText("Level $levelId"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: Spacing.medium,
            children: [
              GameActionButton(
                text: "Reset",
                icon: Icons.refresh,
                onPressed: () {
                  gameRef.loadLevel(gameRef.level, resetTimer: false);
                },
              ),
              GameActionButton(
                text: "Quit",
                icon: Icons.close,
                onPressed: () => Get.back(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WinOverlay extends StatelessWidget {
  final int levelId;
  final String formattedTime;
  final bool isLastLevel;

  const WinOverlay({
    super.key,
    required this.formattedTime,
    required this.isLastLevel,
    required this.levelId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.8),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Spacing.medium,
        children: [
          GameText("Level $levelId completed!", color: Colors.white),
          GameText(
            "Time: $formattedTime",
            size: FontSize.subtitle,
            color: Colors.white,
          ),
          isLastLevel
              ? GameText("All levels completed!", color: Colors.white)
              : GameButton(
                  text: "Next Level",
                  onPressed: () {
                    Get.back();
                    Get.to(() => GameScreen(levelId: levelId + 1));
                  },
                  primary: true,
                  color: Colors.white,
                  minWidth: 300,
                ),
          GameButton(
            text: "Back to Levels",
            onPressed: () => Get.to(() => LevelScreen()),
            color: Colors.white,
            minWidth: 300,
          ),
        ],
      ),
    );
  }
}
