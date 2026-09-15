import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queens/widgets/common.dart';
import 'package:queens/config/constants.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Spacing.medium,
        children: [
          GameText("How to Play", size: FontSize.subtitle),
          Column(
            spacing: Spacing.small,
            children: [
              GameText(
                "The goal of the game is to place N number of queens on a NxN board.",
                size: FontSize.body,
              ),
              GameText(
                "The queens must be placed so that each row, column and color region has exactly one queen.",
                size: FontSize.body,
              ),
              GameText(
                "Additionally, no other queen can be on the 8 adjacent squares of any queen.",
                size: FontSize.body,
              ),
              GameText(
                "Tapping a square first places a cross (used to mark incorrect squares), and then a queen on the second tap. Third tap removes the queen.",
                size: FontSize.body,
              ),
              GameText(
                "The game is won when all queens are placed on the board correctly.",
                size: FontSize.body,
              ),
              GameText(
                "There is only one correct solution and no guessing is needed.",
                size: FontSize.body,
              ),
            ],
          ),
          GameButton(text: "Back", onPressed: () => Get.back()),
        ],
      ),
    );
  }
}
