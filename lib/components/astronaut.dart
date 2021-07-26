import 'dart:ui';
import 'package:astronaut_flame/abstract/spawned_component.dart';
import 'package:astronaut_flame/globals/globals.dart';
import 'package:flame/sprite.dart';

class Astronaut implements SpawnedComponent {
  @override
  Rect componentRect;
  @override
  Sprite componentSprite;
  @override
  bool isOffScreen = false;

  Astronaut(double x, double y) {
    componentSprite = Sprite('astronaut48.png');
    componentRect = Rect.fromLTWH(x, y, GameWorldMeasures.astronautSize.width,
        GameWorldMeasures.astronautSize.height);
  }

  @override
  void render(Canvas c) {
    componentSprite.renderRect(c, componentRect);
  }

  @override
  void update(double t) {
    componentRect = componentRect.translate(
        0, GameWorldMeasures.unit * GameWorldSpeed.astronautSpeed * t);
    if (componentRect.top > GameWorldMeasures.screenSize.height) {
      isOffScreen = true;
    }
  }
}
