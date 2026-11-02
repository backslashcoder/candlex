import 'package:flutter/material.dart';

import '../enums.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Status badge for a trading-signal lifecycle state.
class SignalStatusBadge extends StatelessWidget {
  const SignalStatusBadge(this.status, {super.key});
  final SignalStatus status;

  @override
  Widget build(BuildContext context) {
    final (color, bg) = switch (status) {
      SignalStatus.active => (AppColors.accent, AppColors.accentBackground),
      SignalStatus.triggered => (AppColors.warning, AppColors.warningBackground),
      SignalStatus.targetReached =>
        (AppColors.bullish, AppColors.bullishBackground),
      SignalStatus.invalidated => (AppColors.bearish, AppColors.bearishBackground),
      SignalStatus.expired => (AppColors.textTertiary, AppColors.surfaceSecondary),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 5),
          Text(status.label,
              style: AppTypography.caption
                  .copyWith(color: color, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

/// Prominent banner/pill indicating all data is simulated.
class MockDataBadge extends StatelessWidget {
  const MockDataBadge({super.key, this.compact = false});
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: compact ? 7 : 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.warningBackground,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.warning.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.science_outlined, size: 13, color: AppColors.warning),
          const SizedBox(width: 5),
          Text(
            compact ? 'MOCK DATA' : 'SIMULATED DATA · NOT LIVE',
            style: AppTypography.caption.copyWith(
              color: AppColors.warning,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// Generic small label tag.
class TagChip extends StatelessWidget {
  const TagChip(this.text, {super.key, this.color});
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.textSecondary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(text,
          style: AppTypography.caption.copyWith(color: c)),
    );
  }
}
