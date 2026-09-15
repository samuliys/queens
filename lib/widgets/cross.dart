import 'package:flame/components.dart';

class Cross extends SpriteComponent {
  Cross({
    required Vector2 size,
    required Vector2 position,
    Anchor anchor = Anchor.center,
  }) : super(
          size: size,
          position: position,
          anchor: anchor,
        );

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('cross.png');
  }
}