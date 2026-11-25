import 'package:flutter/material.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/data/models/weight_entry.dart';

class WeightLineChart extends StatelessWidget {
  final List<WeightEntry> entries;
  final double width;
  final double height;

  const WeightLineChart({super.key, required this.entries, this.width = 300, this.height = 80});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) return SizedBox(height: height);
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(painter: _LinePainter(entries)),
    );
  }
}

class _LinePainter extends CustomPainter {
  final List<WeightEntry> entries;
  _LinePainter(this.entries);

  @override
  void paint(Canvas canvas, Size size) {
    if (entries.length < 2) return;

    double minW = entries.map((e) => e.weight).reduce((a, b) => a < b ? a : b);
    double maxW = entries.map((e) => e.weight).reduce((a, b) => a > b ? a : b);
    if (minW == maxW) {
      minW -= 1;
      maxW += 1;
    }

    final dx = size.width / (entries.length - 1);
    final path = Path();
    final fillPath = Path();

    for (int i = 0; i < entries.length; i++) {
      final x = dx * i;
      final y = size.height - ((entries[i].weight - minW) / (maxW - minW)) * size.height;

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
      if (i == entries.length - 1) {
        fillPath.lineTo(x, size.height);
        fillPath.close();
      }
    }

    final fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [AppColors.primary.withValues(alpha: 0.3), AppColors.primary.withValues(alpha: 0.0)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);

    final linePaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, linePaint);

    final lastX = size.width;
    final lastY = size.height - ((entries.last.weight - minW) / (maxW - minW)) * size.height;
    canvas.drawCircle(Offset(lastX, lastY), 6, Paint()..color = AppColors.primary);
  }

  @override
  bool shouldRepaint(covariant _LinePainter oldDelegate) => true;
}
