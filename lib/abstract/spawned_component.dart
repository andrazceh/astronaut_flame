import 'package:astronaut_flame/abstract/component.dart';
import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';

abstract class SpawnedComponent implements Component {
  Rect componentRect;
  Sprite componentSprite;
  bool isOffScreen;
}
