import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/formatting/formatters.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

/// Ticking wall-clock + date. Owns its own 1s timer, cancelled on dispose.
class LiveClock extends StatefulWidget {
  const LiveClock({super.key});

  @override
  State<LiveClock> createState() => _LiveClockState();
}

class _LiveClockState extends State<LiveClock> {
  late Timer _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Formatters.time(_now),
            style: AppTypography.numSmall.copyWith(color: AppColors.textPrimary)),
        Text(Formatters.date(_now), style: AppTypography.caption),
      ],
    );
  }
}
