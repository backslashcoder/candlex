import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

class SettingRow extends StatelessWidget {
  const SettingRow({
    super.key,
    required this.label,
    this.description,
    required this.trailing,
  });

  final String label;
  final String? description;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTypography.body),
                if (description != null) ...[
                  const SizedBox(height: 2),
                  Text(description!, style: AppTypography.caption),
                ],
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class SettingToggle extends StatelessWidget {
  const SettingToggle({super.key, required this.value, required this.onChanged});
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      thumbColor: WidgetStateProperty.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? Colors.white
              : AppColors.textTertiary),
      trackColor: WidgetStateProperty.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.accent
              : AppColors.surfaceElevated),
      trackOutlineColor: WidgetStateProperty.all(AppColors.border),
    );
  }
}
