import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_hooks/flutter_hooks.dart';

class CurveWave extends Curve {
  const CurveWave();
  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter(
    this._animation, {
    required this.color,
  }) : super(repaint: _animation);
  final Color color;
  final Animation<double> _animation;
  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color colorOpacity = color.withOpacity(opacity);
    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);
    final Paint paint = Paint()..color = colorOpacity;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 20, size.width, 20);
    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}

class RipplesAnimation extends StatefulHookWidget {
  const RipplesAnimation(
      {Key? key,
      this.size = 20.0,
      this.color = Colors.red,
      required this.child,
      required this.controller,
      this.onPressed})
      : super(key: key);
  final double size;
  final Color color;
  final Widget child;
  final AnimationController controller;
  final void Function(bool)? onPressed;
  @override
  _RipplesAnimationState createState() => _RipplesAnimationState();
}

class _RipplesAnimationState extends State<RipplesAnimation> {
  @override
  Widget build(BuildContext context) {
    final isAnimating = useState(false);

    return GestureDetector(
      onTap: () {
        if (isAnimating.value) {
          widget.controller.stop();
          isAnimating.value = false;
        } else {
          widget.controller.repeat();
          isAnimating.value = true;
        }
        widget.onPressed?.call(isAnimating.value);
      },
      child: CustomPaint(
        painter: isAnimating.value
            ? CirclePainter(
                widget.controller,
                color: widget.color,
              )
            : null,
        child: SizedBox(
          width: widget.size * 4.125,
          height: widget.size * 4.125,
          child: widget.child,
        ),
      ),
    );
  }
}
