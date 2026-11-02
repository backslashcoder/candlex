import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Compact search input used in boards, scanner and watchlists.
class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onChanged,
    this.hint = 'Search symbol…',
    this.width = 180,
    this.controller,
  });

  final ValueChanged<String> onChanged;
  final String hint;
  final double width;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 32,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTypography.bodySmall.copyWith(color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: const Icon(Icons.search, size: 15),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 30, minHeight: 30),
          contentPadding: const EdgeInsets.symmetric(vertical: 6),
        ),
      ),
    );
  }
}

/// Selectable chip used for tabs and quick filters.
class AppFilterChip extends StatelessWidget {
  const AppFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.color,
    this.count,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color? color;
  final int? count;

  @override
  Widget build(BuildContext context) {
    final accent = color ?? AppColors.accent;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? accent.withValues(alpha: 0.14) : AppColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          border: Border.all(
            color: selected ? accent.withValues(alpha: 0.6) : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: selected ? AppColors.textPrimary : AppColors.textSecondary,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            if (count != null) ...[
              const SizedBox(width: 6),
              Text('$count',
                  style: AppTypography.caption.copyWith(
                      color: selected ? accent : AppColors.textTertiary)),
            ],
          ],
        ),
      ),
    );
  }
}

/// Minimal styled dropdown.
class CompactDropdown<T> extends StatelessWidget {
  const CompactDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.labelOf,
    required this.onChanged,
    this.icon,
    this.width,
  });

  final T value;
  final List<T> items;
  final String Function(T) labelOf;
  final ValueChanged<T?> onChanged;
  final IconData? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isDense: true,
          isExpanded: width != null,
          icon: Icon(icon ?? Icons.keyboard_arrow_down,
              size: 16, color: AppColors.textSecondary),
          dropdownColor: AppColors.surfaceElevated,
          style: AppTypography.bodySmall.copyWith(color: AppColors.textPrimary),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          items: items
              .map((e) => DropdownMenuItem<T>(value: e, child: Text(labelOf(e))))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
