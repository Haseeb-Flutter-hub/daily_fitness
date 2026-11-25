import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';

/// Concentric rings. colored = false: halke background rings (Splash).
/// colored = true: lime aur coral rings wala graphic (Welcome).
class RingsGraphic extends StatelessWidget {
  final double size;
  final bool colored;
  const RingsGraphic({super.key, required this.size, this.colored = false});

  @override
  Widget build(BuildContext context) => CustomPaint(
        size: Size.square(size),
        painter: _RingsPainter(colored),
      );
}

class _RingsPainter extends CustomPainter {
  final bool colored;
  _RingsPainter(this.colored);

  @override
  void paint(Canvas canvas, Size s) {
    final c = s.center(Offset.zero);
    final w = s.width;
    final faint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = AppColors.border;
    for (final r in colored ? [0.433, 0.333] : [0.487, 0.385, 0.282]) {
      canvas.drawCircle(c, w * r, faint);
    }
    if (colored) {
      canvas.drawCircle(
        c, w * 0.233,
        Paint()..style = PaintingStyle.stroke..strokeWidth = w * 0.047..color = AppColors.primary,
      );
      canvas.drawCircle(
        c, w * 0.133,
        Paint()..style = PaintingStyle.stroke..strokeWidth = w * 0.033..color = AppColors.danger,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RingsPainter old) => old.colored != colored;
}
