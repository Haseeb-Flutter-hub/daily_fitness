import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';

/// App ka icon: ring + bijli. Splash aur kahin bhi logo ke liye.
class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({super.key, this.size = 100});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _LogoPainter()),
      );
}

class _LogoPainter extends CustomPainter {
  static const _bolt = [
    Offset(13, 2), Offset(4, 14), Offset(11, 14),
    Offset(10, 22), Offset(19, 10), Offset(12, 10),
  ];

  @override
  void paint(Canvas canvas, Size s) {
    final u = s.width / 100;
    final rect = RRect.fromRectAndRadius(Offset.zero & s, Radius.circular(22 * u));
    canvas.drawRRect(rect, Paint()..color = AppColors.background);
    canvas.drawRRect(
      rect.deflate(0.75 * u),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5 * u
        ..color = AppColors.border,
    );

    final center = Offset(50 * u, 50 * u);
    final radius = 36 * u;
    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7 * u
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, ring..color = AppColors.elevated);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159265 / 2,
      3.14159265 * 2 * 0.75,
      false,
      ring..color = AppColors.primary,
    );
    canvas.drawCircle(Offset(50 * u, 14 * u), 4.5 * u, Paint()..color = AppColors.danger);

    final path = Path();
    for (var i = 0; i < _bolt.length; i++) {
      final p = Offset((31 + 1.58 * _bolt[i].dx) * u, (31 + 1.58 * _bolt[i].dy) * u);
      i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
    }
    path.close();
    canvas.drawPath(path, Paint()..color = AppColors.primary);
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.9 * u
        ..strokeJoin = StrokeJoin.round
        ..color = AppColors.primary,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
