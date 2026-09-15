import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:queens/config/constants.dart';
import 'package:queens/queens_game.dart';
import 'package:queens/widgets/crown.dart';
import 'package:queens/widgets/cross.dart';

class Square extends RectangleComponent
    with HasGameRef<QueensGame>, TapCallbacks {
  final int row;
  final int col;
  final int color;

  int state = 0; // 0 = empty, 1 = X, 2 = crown
  Crown? crown;
  Cross? cross;
  bool invalid = false;

  RectangleComponent? border;
  CircleComponent? invalidMarker;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    crown = Crown(size: size * 0.6, position: size / 2);
    cross = Cross(size: size * 0.4, position: size / 2);
    border = RectangleComponent(
      size: size,
      paint: Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.black,
    );
    add(border!);
  }

  bool get hasCrown => state == 2;

  Square({
    required this.row,
    required this.col,
    required this.color,
    required double size,
    required Vector2 position,
  }) : super(
         position: position,
         size: Vector2.all(size),
         paint: Paint()..color = regionColors[color],
       );

  @override
  void onTapDown(TapDownEvent event) {
    updateState();
    gameRef.checkWinCondition();
  }

  void updateState() {
    state = (state + 1) % 3;

    if (state == 0) {
      crown?.removeFromParent();
      clearInvalid();
    } else if (state == 1) {
      add(cross!);
    } else if (state == 2) {
      cross?.removeFromParent();
      add(crown!);
    }
  }

  void markInvalid() {
    if (!invalid) {
      invalid = true;
      invalidMarker = CircleComponent(
        radius: size.x * 0.4,
        position: size / 2,
        anchor: Anchor.center,
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.red
          ..strokeWidth = 5,
      );
      add(invalidMarker!);
    }
  }

  void clearInvalid() {
    if (invalid) {
      invalid = false;
      invalidMarker?.removeFromParent();
    }
  }
}
