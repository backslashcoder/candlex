import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector.dart';
import '../../../core/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/badges.dart';
import '../../../core/widgets/inputs.dart';
import '../../../core/widgets/page_scaffold.dart';
import '../../../core/widgets/panel.dart';
import '../../../core/widgets/section_header.dart';
import '../data/settings_service.dart';
import '../domain/app_settings.dart';
import 'cubit/settings_cubit.dart';
import 'widgets/setting_tiles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(sl<SettingsService>()),
      child: const _SettingsView(),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, AppSettings>(
      builder: (context, settings) {
        final cubit = context.read<SettingsCubit>();
        return PageScaffold(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SectionHeader(
                    title: 'Settings',
                    subtitle: 'Appearance, formatting and scan defaults',
                    icon: Icons.settings_outlined,
                  ),
                  TerminalPanel(
                    title: 'Appearance',
                    headerIcon: Icons.palette_outlined,
                    child: Column(
                      children: [
                        SettingRow(
                          label: 'Theme',
                          description:
                              'Dark institutional theme. Light theme is architected for a future release.',
                          trailing: TagChip('Dark', color: AppColors.accent),
                        ),
                        SettingRow(
                          label: 'Compact tables',
                          description: 'Denser rows for information-rich boards.',
                          trailing: SettingToggle(
                            value: settings.compactTables,
                            onChanged: (v) => cubit
                                .update(settings.copyWith(compactTables: v)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  TerminalPanel(
                    title: 'Formatting & Defaults',
                    headerIcon: Icons.tune,
                    child: Column(
                      children: [
                        SettingRow(
                          label: 'Number format',
                          description: 'Indian (lakh/crore) or international grouping.',
                          trailing: CompactDropdown<NumberFormatStyle>(
                            value: settings.numberFormat,
                            items: NumberFormatStyle.values,
                            labelOf: (f) => f == NumberFormatStyle.indian
                                ? 'Indian'
                                : 'International',
                            onChanged: (v) => cubit
                                .update(settings.copyWith(numberFormat: v)),
                          ),
                        ),
                        SettingRow(
                          label: 'Default timeframe',
                          description: 'Applied when opening a stock chart.',
                          trailing: CompactDropdown<Timeframe>(
                            value: settings.defaultTimeframe,
                            items: Timeframe.values,
                            labelOf: (t) => t.label,
                            onChanged: (v) => cubit
                                .update(settings.copyWith(defaultTimeframe: v)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  TerminalPanel(
                    title: 'Scanner Defaults',
                    headerIcon: Icons.radar_outlined,
                    child: Column(
                      children: [
                        _SliderSetting(
                          label: 'Default minimum strength',
                          value: settings.minStrengthDefault,
                          max: 100,
                          onChanged: (v) => cubit.update(
                              settings.copyWith(minStrengthDefault: v)),
                        ),
                        _SliderSetting(
                          label: 'Default minimum volume ratio',
                          value: settings.minVolumeRatioDefault,
                          max: 3,
                          decimals: 1,
                          suffix: 'x',
                          onChanged: (v) => cubit.update(
                              settings.copyWith(minVolumeRatioDefault: v)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  TerminalPanel(
                    title: 'Data Source',
                    headerIcon: Icons.cloud_outlined,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SettingRow(
                          label: 'Market data',
                          description:
                              'Simulated feed. Live Go backend / WebSocket integration planned.',
                          trailing: const MockDataBadge(compact: true),
                        ),
                        SettingRow(
                          label: 'Telegram alerts',
                          description: 'Configured on the Telegram Alerts screen.',
                          trailing: TagChip(
                            settings.telegramConnected ? 'Connected' : 'Not set up',
                            color: settings.telegramConnected
                                ? AppColors.bullish
                                : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SliderSetting extends StatelessWidget {
  const _SliderSetting({
    required this.label,
    required this.value,
    required this.max,
    required this.onChanged,
    this.decimals = 0,
    this.suffix = '',
  });

  final String label;
  final double value;
  final double max;
  final ValueChanged<double> onChanged;
  final int decimals;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: AppTypography.body),
              Text('${value.toStringAsFixed(decimals)}$suffix',
                  style: AppTypography.num.copyWith(color: AppColors.accent)),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 3,
              activeTrackColor: AppColors.accent,
              inactiveTrackColor: AppColors.surfaceSecondary,
              thumbColor: AppColors.accent,
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(
                value: value.clamp(0, max), max: max, onChanged: onChanged),
          ),
        ],
      ),
    );
  }
}
