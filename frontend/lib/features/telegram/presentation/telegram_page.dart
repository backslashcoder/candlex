import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector.dart';
import '../../../core/formatting/formatters.dart';
import '../../../core/mock/market_data_store.dart';
import '../../../core/models/alert.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/badges.dart';
import '../../../core/widgets/page_scaffold.dart';
import '../../../core/widgets/panel.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/states.dart';
import '../../settings/data/settings_service.dart';
import '../../settings/domain/app_settings.dart';
import '../../settings/presentation/cubit/settings_cubit.dart';
import '../../settings/presentation/widgets/setting_tiles.dart';

class TelegramPage extends StatelessWidget {
  const TelegramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(sl<SettingsService>()),
      child: const _TelegramView(),
    );
  }
}

class _TelegramView extends StatelessWidget {
  const _TelegramView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, AppSettings>(
      builder: (context, settings) {
        final cubit = context.read<SettingsCubit>();
        final wide = MediaQuery.sizeOf(context).width >= AppSpacing.tabletBreakpoint;

        final left = Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ConnectionCard(settings: settings, cubit: cubit),
            const SizedBox(height: AppSpacing.lg),
            _PreferencesCard(settings: settings, cubit: cubit),
          ],
        );
        final right = Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _MessagePreview(),
            const SizedBox(height: AppSpacing.lg),
            const _AlertHistory(),
          ],
        );

        return PageScaffold(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeader(
                title: 'Telegram Alerts',
                subtitle: 'Configure alerts · live bot wiring ships with the backend',
                icon: Icons.send_outlined,
                trailing: const MockDataBadge(),
              ),
              if (wide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: left),
                    const SizedBox(width: AppSpacing.lg),
                    Expanded(child: right),
                  ],
                )
              else ...[
                left,
                const SizedBox(height: AppSpacing.lg),
                right,
              ],
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        );
      },
    );
  }
}

class _ConnectionCard extends StatelessWidget {
  const _ConnectionCard({required this.settings, required this.cubit});
  final AppSettings settings;
  final SettingsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final connected = settings.telegramConnected;
    return TerminalPanel(
      title: 'Connection',
      headerIcon: Icons.link,
      trailing: TagChip(connected ? 'Connected' : 'Disconnected',
          color: connected ? AppColors.bullish : AppColors.textSecondary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.accentBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.send, color: AppColors.accent, size: 20),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  connected
                      ? 'Simulated bot connected. Alerts below would be delivered to your Telegram.'
                      : 'Connect a Telegram bot to receive market alerts (simulated).',
                  style: AppTypography.bodySmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          if (!connected) ...[
            Text('SETUP STEPS', style: AppTypography.caption),
            const SizedBox(height: 6),
            _step(1, 'Create a bot with @BotFather in Telegram'),
            _step(2, 'Copy the bot token (kept on the backend — never in the app)'),
            _step(3, 'Start a chat and link your chat ID'),
            const SizedBox(height: AppSpacing.md),
          ],
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: connected ? AppColors.bearish : AppColors.accent,
            ),
            onPressed: () => cubit.connectTelegram(!connected),
            icon: Icon(connected ? Icons.link_off : Icons.link, size: 16),
            label: Text(connected ? 'Disconnect' : 'Connect bot (simulated)'),
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.warningBackground,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.lock_outline, size: 13, color: AppColors.warning),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Real bot tokens are never stored in frontend code. Live delivery ships with the Go backend.',
                    style: AppTypography.caption.copyWith(color: AppColors.warning),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _step(int n, String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.surfaceSecondary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text('$n', style: AppTypography.caption),
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(text, style: AppTypography.bodySmall)),
          ],
        ),
      );
}

class _PreferencesCard extends StatelessWidget {
  const _PreferencesCard({required this.settings, required this.cubit});
  final AppSettings settings;
  final SettingsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return TerminalPanel(
      title: 'Notification Preferences',
      headerIcon: Icons.notifications_active_outlined,
      child: Column(
        children: [
          _toggle('Bullish signals', settings.alertBullish,
              (v) => cubit.update(settings.copyWith(alertBullish: v))),
          _toggle('Bearish signals', settings.alertBearish,
              (v) => cubit.update(settings.copyWith(alertBearish: v))),
          _toggle('Entry triggers', settings.alertEntryTriggers,
              (v) => cubit.update(settings.copyWith(alertEntryTriggers: v))),
          _toggle('Target updates', settings.alertTargetUpdates,
              (v) => cubit.update(settings.copyWith(alertTargetUpdates: v))),
          _toggle('Invalidations', settings.alertInvalidations,
              (v) => cubit.update(settings.copyWith(alertInvalidations: v))),
          _toggle('Daily market summary', settings.alertDailySummary,
              (v) => cubit.update(settings.copyWith(alertDailySummary: v))),
          const Divider(height: AppSpacing.lg),
          _toggle('Selected stocks only', settings.alertSelectedStocksOnly,
              (v) => cubit.update(settings.copyWith(alertSelectedStocksOnly: v))),
          _toggle('Selected strategies only', settings.alertSelectedStrategiesOnly,
              (v) =>
                  cubit.update(settings.copyWith(alertSelectedStrategiesOnly: v))),
        ],
      ),
    );
  }

  Widget _toggle(String label, bool value, ValueChanged<bool> onChanged) =>
      SettingRow(
          label: label,
          trailing: SettingToggle(value: value, onChanged: onChanged));
}

class _MessagePreview extends StatelessWidget {
  const _MessagePreview();

  @override
  Widget build(BuildContext context) {
    final alert = sl<MarketDataStore>().alerts.isNotEmpty
        ? sl<MarketDataStore>().alerts.first
        : null;
    return TerminalPanel(
      title: 'Message Preview',
      headerIcon: Icons.chat_bubble_outline,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: const Color(0xFF17212B),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.accent,
                    child: Icon(Icons.smart_toy, size: 13, color: Colors.white)),
                const SizedBox(width: 8),
                Text('CandleX Bot',
                    style: AppTypography.numSmall
                        .copyWith(color: AppColors.accent)),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: const Color(0xFF2B5278),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                alert == null
                    ? '📈 Bullish setup on RELIANCE\nEntry 2910–2925 · SL 2880 · T1 2970\nStrategy: VWAP Trend · Conf 74% (sim)'
                    : '${alert.direction.name == 'bullish' ? '📈' : '📉'} ${alert.message}',
                style: AppTypography.bodySmall.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 6),
            Text('Simulated preview', style: AppTypography.caption),
          ],
        ),
      ),
    );
  }
}

class _AlertHistory extends StatelessWidget {
  const _AlertHistory();

  @override
  Widget build(BuildContext context) {
    final alerts = sl<MarketDataStore>().alerts;
    return TerminalPanel(
      padding: EdgeInsets.zero,
      title: 'Alert History',
      headerIcon: Icons.history,
      child: alerts.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(AppSpacing.xl),
              child: EmptyState(title: 'No alerts yet'),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: alerts.length.clamp(0, 14),
              itemBuilder: (context, i) {
                final a = alerts[i];
                final color = a.direction.name == 'bullish'
                    ? AppColors.bullish
                    : a.direction.name == 'bearish'
                        ? AppColors.bearish
                        : AppColors.textSecondary;
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md, vertical: 9),
                  decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: AppColors.borderSubtle)),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: 6,
                          height: 6,
                          decoration:
                              BoxDecoration(color: color, shape: BoxShape.circle)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(a.kind.label,
                                style: AppTypography.caption
                                    .copyWith(color: color)),
                            Text(a.message,
                                style: AppTypography.caption,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(Formatters.shortTime(a.time),
                          style: AppTypography.caption),
                      const SizedBox(width: 8),
                      Icon(
                          a.delivered ? Icons.done_all : Icons.schedule,
                          size: 13,
                          color: a.delivered
                              ? AppColors.accent
                              : AppColors.textTertiary),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
