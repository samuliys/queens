import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:queens/queens_game.dart';
import 'package:queens/config/constants.dart';

class GameTimer extends TextComponent with HasGameRef<QueensGame> {
  double seconds = 0;
  bool active = true;

  GameTimer({required Vector2 position})
      : super(
          position: position,
          anchor: Anchor.topCenter,
          textRenderer: TextPaint(
            style: const TextStyle(
              fontSize: FontSize.title,
              color: Colors.black,
            ),
          ),
        );

  @override
  void update(double dt) {
    super.update(dt);
    if (active) {
      seconds += dt;
      text = formatTime(seconds);
    }
  }

  String formatTime(double totalSeconds) {
    final int minutes = (totalSeconds / 60).floor();
    final int seconds = (totalSeconds % 60).floor();
    
    final String minStr = minutes.toString().padLeft(2, '0');
    final String secStr = seconds.toString().padLeft(2, '0');
    
    return '$minStr:$secStr';
  }

  void reset() {
    seconds = 0;
    active = true;
  }

  void stop() {
    active = false;
  }
}