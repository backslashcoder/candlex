import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector.dart';
import '../../../core/cubit/view_status.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/panel.dart';
import '../../../core/widgets/states.dart';
import '../../settings/data/settings_service.dart';
import '../domain/stock_detail_repository.dart';
import 'chart/candle_chart.dart';
import 'chart/chart_config.dart';
import 'chart/chart_toolbar.dart';
import 'cubit/stock_detail_cubit.dart';
import 'widgets/analysis_panel.dart';
import 'widgets/detail_header.dart';
import 'widgets/setup_panel.dart';

/// The large stock-detail / chart workspace, shown as a modal overlay.
class StockDetailModal extends StatelessWidget {
  const StockDetailModal({super.key, required this.symbol});
  final String symbol;

  @override
  Widget build(BuildContext context) {
    final tf = sl<SettingsService>().settings.defaultTimeframe;
    return BlocProvider(
      create: (_) =>
          StockDetailCubit(sl<StockDetailRepository>(), initialTimeframe: tf)
            ..load(symbol),
      child: const _ModalBody(),
    );
  }
}

class _ModalBody extends StatelessWidget {
  const _ModalBody();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = (size.width * 0.92).clamp(320.0, 1240.0);
    final height = (size.height * 0.9).clamp(360.0, 860.0);
    final narrow = width < 900;

    return Dialog(
      backgroundColor: AppColors.panel,
      insetPadding: const EdgeInsets.all(AppSpacing.lg),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        side: const BorderSide(color: AppColors.border),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: BlocBuilder<StockDetailCubit, StockDetailState>(
          builder: (context, state) {
            if (state.status.isLoading || state.status.isInitial) {
              return const LoadingState(label: 'Loading chart…');
            }
            if (state.status.isError || state.stock == null) {
              return ErrorStateView(
                message: state.error ?? 'Unable to load stock.',
                onRetry: () {},
              );
            }
            final stock = state.stock!;
            final cubit = context.read<StockDetailCubit>();
            final chart = _ChartArea(state: state, cubit: cubit);
            final side = state.analysis == null
                ? const SizedBox.shrink()
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      children: [
                        AnalysisPanel(analysis: state.analysis!),
                        const SizedBox(height: AppSpacing.md),
                        SetupPanel(stock: stock, analysis: state.analysis!),
                      ],
                    ),
                  );

            return Column(
              children: [
                DetailHeader(
                    stock: stock, onClose: () => Navigator.of(context).pop()),
                Expanded(
                  child: narrow
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 360, child: chart),
                              side,
                            ],
                          ),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(flex: 3, child: chart),
                            SizedBox(
                              width: 340,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  border: Border(
                                      left: BorderSide(color: AppColors.border)),
                                ),
                                child: side,
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ChartArea extends StatelessWidget {
  const _ChartArea({required this.state, required this.cubit});
  final StockDetailState state;
  final StockDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChartToolbar(
            timeframe: state.timeframe,
            onTimeframe: cubit.changeTimeframe,
            config: state.config,
            onConfig: cubit.updateConfig,
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: TerminalPanel(
              padding: const EdgeInsets.fromLTRB(8, 10, 4, 6),
              child: CandleChart(
                data: ChartData(candles: state.candles, analysis: state.analysis),
                config: state.config,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
