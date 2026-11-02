import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/seeded_random.dart';

/// A tiny deterministic intraday sparkline. The path is seeded by the symbol so
/// it is stable across rebuilds; the overall slope follows [changePercent].
class MiniSparkline extends StatelessWidget {
  const MiniSparkline({
    super.key,
    required this.seedKey,
    required this.changePercent,
    required this.color,
    this.height = 34,
    this.fill = true,
  });

  final String seedKey;
  final double changePercent;
  final Color color;
  final double height;
  final bool fill;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _SparklinePainter(
          seedKey: seedKey,
          changePercent: changePercent,
          color: color,
          fill: fill,
        ),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  _SparklinePainter({
    required this.seedKey,
    required this.changePercent,
    required this.color,
    required this.fill,
  });

  final String seedKey;
  final double changePercent;
  final Color color;
  final bool fill;

  @override
  void paint(Canvas canvas, Size size) {
    const n = 26;
    final rng = SeededRandom(stableHash('spark-$seedKey'));
    // Build a mean-reverting walk, then tilt it by the day's change.
    final values = <double>[];
    double v = 0;
    for (int i = 0; i < n; i++) {
      v += rng.noise(1) - v * 0.18;
      values.add(v);
    }
    final slope = changePercent.clamp(-6.0, 6.0) / 6.0;
    for (int i = 0; i < n; i++) {
      values[i] += slope * (i / (n - 1)) * 3.2;
    }
    final lo = values.reduce(math.min);
    final hi = values.reduce(math.max);
    final span = (hi - lo).abs() < 1e-6 ? 1.0 : hi - lo;

    const pad = 2.0;
    double x(int i) => i / (n - 1) * size.width;
    double y(double val) =>
        size.height - pad - (val - lo) / span * (size.height - pad * 2);

    final path = Path()..moveTo(x(0), y(values[0]));
    for (int i = 1; i < n; i++) {
      path.lineTo(x(i), y(values[i]));
    }

    if (fill) {
      final area = Path.from(path)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close();
      canvas.drawPath(
        area,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color.withValues(alpha: 0.22), color.withValues(alpha: 0)],
          ).createShader(Offset.zero & size),
      );
    }

    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.4
        ..strokeJoin = StrokeJoin.round
        ..color = color,
    );

    // Last-point marker.
    canvas.drawCircle(
      Offset(x(n - 1), y(values[n - 1])),
      2.0,
      Paint()..color = color,
    );
    // Faint baseline.
    canvas.drawLine(
      Offset(0, size.height - pad),
      Offset(size.width, size.height - pad),
      Paint()
        ..color = AppColors.gridLine
        ..strokeWidth = 0.5,
    );
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter old) =>
      old.changePercent != changePercent ||
      old.color != color ||
      old.seedKey != seedKey;
}
