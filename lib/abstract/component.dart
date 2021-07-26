import 'dart:ui';

abstract class Component {
  void render(Canvas c);
  void update(double t);
}
