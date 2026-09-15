import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:get/get.dart';
import 'package:queens/models/level.dart';
import 'package:queens/models/square.dart';
import 'package:queens/widgets/timer.dart';
import 'package:queens/controllers/score_controller.dart';

class QueensGame extends FlameGame {
  Level level;

  GameTimer? timer;

  final scoreController = Get.find<ScoreController>();
  final double yOffset = 120.0;

  QueensGame({required this.level})
    : super(
        camera: CameraComponent.withFixedResolution(width: 720, height: 1280),
      );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    timer = GameTimer(position: Vector2(0, -400 + yOffset));

    loadLevel(level);
  }

  void checkWinCondition() {
    final squares = world.children.whereType<Square>().toList();
    final crowns = squares.where((s) => s.hasCrown).toList();
    int size = level.size;

    for (var square in crowns) {
      square.clearInvalid();
    }

    for (int i = 0; i < crowns.length; i++) {
      for (int j = i + 1; j < crowns.length; j++) {
        final queen1 = crowns[i];
        final queen2 = crowns[j];

        // Same row or column
        if (queen1.row == queen2.row || queen1.col == queen2.col) {
          queen1.markInvalid();
          queen2.markInvalid();
          continue;
        }

        // Adjacent
        if ((queen1.row - queen2.row).abs() <= 1 &&
            (queen1.col - queen2.col).abs() <= 1) {
          queen1.markInvalid();
          queen2.markInvalid();
          continue;
        }

        // Same region
        if (queen1.color == queen2.color) {
          queen1.markInvalid();
          queen2.markInvalid();
          continue;
        }
      }
    }

    // Must have exactly one queen per row/column
    if (crowns.length != size) {
      return;
    }

    // Check if any queens are marked invalid
    bool allValid = !crowns.any((c) => c.invalid);
    if (allValid) { // Win condition
      timer!.stop();
      scoreController.addScore(level.id, timer!.seconds);
      timer!.removeFromParent();

      overlays.add('win');
      overlays.remove('game');
    }
  }

  void loadLevel(Level level, {bool resetTimer = true}) {
    world.removeAll(world.children);

    final double gridLength = 640.0;
    final double squareSize = gridLength / level.size;

    final double startPosX = -gridLength / 2;
    final double startPosY = -gridLength / 2 + yOffset;

    for (int row = 0; row < level.size; row++) {
      for (int col = 0; col < level.size; col++) {
        int index = row * level.size + col;
        double posX = startPosX + (col * squareSize);
        double posY = startPosY + (row * squareSize);

        final square = Square(
          row: row,
          col: col,
          color: level.regions[index],
          size: squareSize,
          position: Vector2(posX, posY),
        );

        world.add(square);
      }
    }
    timer ??= GameTimer(position: Vector2(0, -400 + yOffset));
    if (resetTimer) {
      timer!.reset();
    }
    world.add(timer!);
  }
}
