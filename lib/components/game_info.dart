import 'dart:ui';
import 'package:astronaut_flame/components/rocket.dart';
import 'package:astronaut_flame/globals/globals.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../abstract/component.dart';

class GameInfo implements Component {
  final Rocket rocket;
  TextPainter healthText;
  TextPainter astronautsText;
  GameInfo(this.rocket) {
    healthText = TextPainter(
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: rocket.health.toString(),
          style: TextStyle(
              color: Colors.green,
              fontSize: GameWorldMeasures.fontSize,
              fontWeight: GameWorldMeasures.fontWeight),
        ));
    healthText.layout();

    astronautsText = TextPainter(
        textAlign: TextAlign.right,
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: rocket.astronauts.toString(),
          style: TextStyle(
              color: Colors.white,
              fontSize: GameWorldMeasures.fontSize,
              fontWeight: GameWorldMeasures.fontWeight),
        ));
    astronautsText.layout();
  }

  @override
  void render(Canvas c) {
    healthText.paint(c, Offset((30), 0));
    healthText.text = TextSpan(
      text: rocket.health.toString(),
      style: TextStyle(
          color: Colors.green,
          fontSize: GameWorldMeasures.fontSize,
          fontWeight: GameWorldMeasures.fontWeight),
    );
    astronautsText.paint(
        c, Offset((GameWorldMeasures.screenSize.width - 50), 0));
    astronautsText.text = TextSpan(
      text: rocket.astronauts.toString(),
      style: TextStyle(
          color: Colors.white,
          fontSize: GameWorldMeasures.fontSize,
          fontWeight: GameWorldMeasures.fontWeight),
    );
  }

  @override
  void update(double t) {
    healthText.layout();
    astronautsText.layout();
  }
}
